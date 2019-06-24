package com.mogujie.tt.imservice.network;

import android.util.Log;

import com.google.protobuf.ByteString;
import com.google.protobuf.CodedInputStream;
import com.mogujie.tt.config.SysConstant;
import com.mogujie.tt.imservice.manager.IMSocketManager;
import com.mogujie.tt.protobuf.IMBaseDefine;
import com.mogujie.tt.protobuf.IMFile;
import com.mogujie.tt.protobuf.base.DataBuffer;
import com.mogujie.tt.protobuf.base.DefaultHeader;

import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.buffer.ChannelBufferInputStream;
import org.jboss.netty.channel.ChannelHandlerContext;
import org.jboss.netty.channel.ChannelStateEvent;
import org.jboss.netty.channel.MessageEvent;
import org.jboss.netty.channel.SimpleChannelHandler;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class TransferFileTask extends SimpleChannelHandler {
    private File file;
    private String taskId;
    private String fileServerIp;
    private int fileServerPort;
    private int userId;
    private int toUserId;
    private FileInputStream fileInputStream;
    private FileOutputStream fileOutputStream;
    private String fileName = "";
    boolean isSender;
    private int transMode;
    private long dataLength;

    private long transferSize;


    SocketThread socketThread;

    final  static int DEFAULTCACHESIZE = 1024;




    private TransferCallBack callBack;

    public TransferFileTask(int userId,int toUserId,String taskId,String fileServerIp, int fileServerPort, int transMode, boolean isSender){
        //this.file = file;
        this.userId = userId;
        this.toUserId = toUserId;
        this.taskId = taskId;
        this.fileServerIp = fileServerIp;
        this.fileServerPort = fileServerPort;
        this.transMode = transMode;
        this.isSender = isSender;
        this.transferSize = 0;
        this.dataLength = 1;//防止除0
    }


    public void setCallBack(TransferCallBack callBack) {
        this.callBack = callBack;
    }

    public int getToUserId() {
        return toUserId;
    }

    public int getUserId() {
        return userId;
    }

    public String getTargetFilePath(){
        if(this.file != null) {
            return this.file.getAbsolutePath();
        }
        return "";
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setTargetFilePath(String path) throws Exception{
        this.setTargetFile(new File(path));
    }

    public void setDataLength(long dataLength) {
        this.dataLength = dataLength;
    }

    public void setTargetFile(File file) throws Exception{

        if(file == null) {
            throw new Exception("file is null");

        }else if(!file.exists() || !file.isFile()) {
            if(isSender) {
                throw new Exception("not such file");
            }
        }


        if(!isSender) {
            fileOutputStream = new FileOutputStream(file);
        }else {
            setDataLength(file.length());
        }

        this.file = file;
    }

    public void startWork(){
        if(socketThread != null) {
            socketThread.close();
            socketThread = null;
        }
        socketThread = new SocketThread(this.fileServerIp,this.fileServerPort,this);
        socketThread.start();

        if(callBack != null) {
            callBack.onStart(this);
        }

    }

    IMBaseDefine.ClientFileRole buildRole(){
        IMBaseDefine.ClientFileRole role = IMBaseDefine.ClientFileRole.CLIENT_OFFLINE_UPLOAD;

        if(transMode == IMBaseDefine.TransferFileType.FILE_TYPE_ONLINE_VALUE) {
            role = IMBaseDefine.ClientFileRole.CLIENT_REALTIME_SENDER;
        }

        if(!isSender) {
            role = IMBaseDefine.ClientFileRole.CLIENT_OFFLINE_DOWNLOAD;
            if(transMode == IMBaseDefine.TransferFileType.FILE_TYPE_ONLINE_VALUE) {
                role = IMBaseDefine.ClientFileRole.CLIENT_REALTIME_RECVER;
            }
        }
        return  role;
    }


    private void loginFileServer(){

        IMBaseDefine.ClientFileRole role = buildRole();
        int workUserId = this.userId;
        if(!isSender) {
            workUserId = this.toUserId;
        }
        IMFile.IMFileLoginReq requset = IMFile.IMFileLoginReq.newBuilder().setFileRole(role).setTaskId(this.taskId).setUserId(workUserId).build();
        int sid = IMBaseDefine.ServiceID.SID_FILE_VALUE;
        int cid = IMBaseDefine.FileCmdID.CID_FILE_LOGIN_REQ_VALUE;
        com.mogujie.tt.protobuf.base.Header header = new DefaultHeader(sid, cid);
        int bodySize = requset.getSerializedSize();
        header.setLength(SysConstant.PROTOCOL_HEADER_LENGTH + bodySize);
        int seqNo = header.getSeqnum();
        socketThread.sendRequest(requset,header);
    }

    private void loginRes(Object response) {
        try {
            IMFile.IMFileLoginRsp rsp = IMFile.IMFileLoginRsp.parseFrom((CodedInputStream)response);
            if(rsp.getResultCode() == 0 ) {
                if(!isSender) {
                    requestPackage();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void answerPullPackage(Object response) {
        try {
            IMFile.IMFilePullDataReq req = IMFile.IMFilePullDataReq.parseFrom((CodedInputStream)response);
            if(fileInputStream == null) {
                fileInputStream = new FileInputStream(this.file);
                fileInputStream.skip(req.getOffset());
            }

            byte[] buffer = new byte[req.getDataSize()];
            int count = fileInputStream.read(buffer);
            IMFile.IMFilePullDataRsp rsp = IMFile.IMFilePullDataRsp.newBuilder().setFileData(ByteString.copyFrom(buffer,0,count)).setTaskId(this.taskId).setOffset(req.getOffset()).setUserId(this.userId).setResultCode(0).build();
            int sid = IMBaseDefine.ServiceID.SID_FILE_VALUE;
            int cid = IMBaseDefine.FileCmdID.CID_FILE_PULL_DATA_RSP_VALUE;

            com.mogujie.tt.protobuf.base.Header header = new DefaultHeader(sid, cid);
            int bodySize = rsp.getSerializedSize();
            header.setLength(SysConstant.PROTOCOL_HEADER_LENGTH + bodySize);
            int seqNo = header.getSeqnum();
            socketThread.sendRequest(rsp,header);




            if(callBack != null) {
                float progressing = (float) ((count + req.getOffset()) * 1.0 / this.dataLength);
                //callBack.onStart(this);
                progressing = (progressing > 1.0)?  1.0f : progressing;
                progressing = (progressing < 0)?  0.0f : progressing;
                callBack.onProgressing(this,progressing);
            }


            //fileInputStream.skip(req.getOffset());

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void onTransferFileStateChange(Object response){
        try {
            IMFile.IMFileState rsp = IMFile.IMFileState.parseFrom((CodedInputStream)response);
            IMBaseDefine.ClientFileState state =  rsp.getState();

            if(state == IMBaseDefine.ClientFileState.CLIENT_FILE_DONE) {
                Log.i("transfer","transfer finished");

                if(isSender) {
                    if(transMode == IMBaseDefine.TransferFileType.FILE_TYPE_OFFLINE_VALUE) {
                        IMFile.IMFileAddOfflineReq requset = IMFile.IMFileAddOfflineReq.newBuilder().setFileName(this.file.getName()).setFileSize((int) this.file.length()).setFromUserId(this.userId).setToUserId(this.toUserId).setTaskId(this.taskId).build();
                        int sid = IMBaseDefine.ServiceID.SID_FILE_VALUE;
                        int cid = IMBaseDefine.FileCmdID.CID_FILE_ADD_OFFLINE_REQ_VALUE;
                        com.mogujie.tt.protobuf.base.Header header = new DefaultHeader(sid, cid);
                        int bodySize = requset.getSerializedSize();
                        header.setLength(SysConstant.PROTOCOL_HEADER_LENGTH + bodySize);
                        int seqNo = header.getSeqnum();
                        IMSocketManager.instance().sendRequest(requset,sid,cid);
                    }
                    if(fileInputStream != null) {
                        fileInputStream.close();
                    }
                }else {

                    if(transMode == IMBaseDefine.TransferFileType.FILE_TYPE_OFFLINE_VALUE) {
                        IMFile.IMFileDelOfflineReq requset = IMFile.IMFileDelOfflineReq.newBuilder().setFromUserId(this.userId).setTaskId(this.taskId).setToUserId(this.toUserId).build();
                        int sid = IMBaseDefine.ServiceID.SID_FILE_VALUE;
                        int cid = IMBaseDefine.FileCmdID.CID_FILE_DEL_OFFLINE_REQ_VALUE;
                        com.mogujie.tt.protobuf.base.Header header = new DefaultHeader(sid, cid);
                        int bodySize = requset.getSerializedSize();
                        header.setLength(SysConstant.PROTOCOL_HEADER_LENGTH + bodySize);
                        int seqNo = header.getSeqnum();
                        IMSocketManager.instance().sendRequest(requset,sid,cid);
                    }

                    if(fileOutputStream != null) {
                        fileOutputStream.close();
                    }
                }
                if(callBack != null) {
                    callBack.onFinished(this);
                }

            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void messageReceived(ChannelHandlerContext ctx, MessageEvent e) throws Exception {
        super.messageReceived(ctx, e);
        ChannelBuffer channelBuffer = (ChannelBuffer) e.getMessage();
        if(null!=channelBuffer){
            DataBuffer buffer = new DataBuffer(channelBuffer);
            com.mogujie.tt.protobuf.base.Header header = new com.mogujie.tt.protobuf.base.Header();
            header.decode(buffer);
            /**buffer 的指针位于body的地方*/
            int commandId = header.getCommandId();
            int serviceId = header.getServiceId();
            int seqNo = header.getSeqnum();

            CodedInputStream codedInputStream = CodedInputStream.newInstance(new ChannelBufferInputStream(buffer.getOrignalBuffer()));

            switch (commandId) {
                case IMBaseDefine.FileCmdID.CID_FILE_LOGIN_RES_VALUE:
                    loginRes(codedInputStream);
                    break;
                case IMBaseDefine.FileCmdID.CID_FILE_PULL_DATA_REQ_VALUE:
                    answerPullPackage(codedInputStream);
                    break;
                case IMBaseDefine.FileCmdID.CID_FILE_PULL_DATA_RSP_VALUE:
                    receivePullPackage(codedInputStream);
                    break;
                case IMBaseDefine.FileCmdID.CID_FILE_STATE_VALUE:
                    onTransferFileStateChange(codedInputStream);
                    break;
                default:
                    break;
            }
        }
    }

    private void requestPackage(){
        int cacheSize = DEFAULTCACHESIZE;
        if(cacheSize > this.dataLength - this.transferSize) {
            cacheSize = (int) (this.dataLength - this.transferSize);
        }
        IMFile.IMFilePullDataReq req = IMFile.IMFilePullDataReq.newBuilder().setTaskId(this.taskId).setUserId(this.toUserId).setTransMode(IMBaseDefine.TransferFileType.forNumber(this.transMode)).setOffset((int) this.transferSize).setDataSize(cacheSize).build();
        int sid = IMBaseDefine.ServiceID.SID_FILE_VALUE;
        int cid = IMBaseDefine.FileCmdID.CID_FILE_PULL_DATA_REQ_VALUE;

        com.mogujie.tt.protobuf.base.Header header = new DefaultHeader(sid, cid);
        int bodySize = req.getSerializedSize();
        header.setLength(SysConstant.PROTOCOL_HEADER_LENGTH + bodySize);
        int seqNo = header.getSeqnum();
        socketThread.sendRequest(req,header);
    }

    private void receivePullPackage(Object response) {
        try {
            IMFile.IMFilePullDataRsp rsp = IMFile.IMFilePullDataRsp.parseFrom((CodedInputStream) response);
            if(fileOutputStream != null) {
                ByteString fileData = rsp.getFileData();
                byte[] buffer = new byte[fileData.size()];
                fileData.copyTo(buffer,0);
                fileOutputStream.write(buffer);
                fileOutputStream.flush();
                this.transferSize = this.transferSize +  fileData.size();
                if(callBack != null) {
                    float progressing = (float) ((rsp.getOffset() + fileData.size()) * 1.0 / this.dataLength);
                    //callBack.onStart(this);
                    progressing = (progressing > 1.0)?  1.0f : progressing;
                    progressing = (progressing < 0)?  0.0f : progressing;

                    callBack.onProgressing(this,progressing);
                }

                if(this.transferSize < this.dataLength) {
                    requestPackage();
                }else {

                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void channelConnected(ChannelHandlerContext ctx, ChannelStateEvent e) throws Exception {
        super.channelConnected(ctx, e);
        loginFileServer();
    }

    public interface TransferCallBack {
        void onStart(TransferFileTask task);
        void onProgressing(TransferFileTask task, float progress);
        void onFinished(TransferFileTask task);
        void onCanceled(TransferFileTask task ,String msg);
    }
}
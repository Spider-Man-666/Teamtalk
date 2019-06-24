package com.mogujie.tt.imservice.manager;



import com.google.protobuf.CodedInputStream;
import com.mogujie.tt.imservice.callback.Packetlistener;
import com.mogujie.tt.imservice.event.TransferFileEvent;
import com.mogujie.tt.imservice.network.TransferFileTask;
import com.mogujie.tt.protobuf.IMBaseDefine;
import com.mogujie.tt.protobuf.IMFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import de.greenrobot.event.EventBus;


public class IMTransferFileManager  extends IMManager{

    private static final IMTransferFileManager ourInstance = new IMTransferFileManager();

    List<TransferFileTask> offlineFileTasks = new ArrayList<>();

    public static IMTransferFileManager instance() {
        return ourInstance;
    }

    public IMTransferFileManager() {
    }


    @Override
    public void doOnStart() {

    }

    @Override
    public void reset() {

    }

    public void triggerEvent(Object event) {
        EventBus.getDefault().post(event);
    }



    public List<TransferFileTask> getOfflineFileTaskByUID(int uid) {

        List<TransferFileTask> tmpOfflineFileTasks = new ArrayList<>();

        for(TransferFileTask task : offlineFileTasks) {
            if(task.getUserId() == uid) {
                tmpOfflineFileTasks.add(task);
            }
        }

        return tmpOfflineFileTasks;
    }


    public void loadHasOfflineFile(final int uid) {
        IMFile.IMFileHasOfflineReq req = IMFile.IMFileHasOfflineReq.newBuilder().setUserId(uid).build();
        int sid = IMBaseDefine.ServiceID.SID_FILE_VALUE;
        int cid = IMBaseDefine.FileCmdID.CID_FILE_HAS_OFFLINE_REQ_VALUE;

        IMSocketManager.instance().sendRequest(req, sid, cid, new Packetlistener() {
            @Override
            public void onSuccess(Object response) {
                try {
                    IMFile.IMFileHasOfflineRsp rsp = IMFile.IMFileHasOfflineRsp.parseFrom((CodedInputStream)response);
                    synchronized (offlineFileTasks) {
                        offlineFileTasks.clear();
                        int offlineFileCount = rsp.getOfflineFileListCount();

                        String ip = rsp.getIpAddrList(0).getIp();
                        int port = rsp.getIpAddrList(0).getPort();

                        if( offlineFileCount > 0 && rsp.getIpAddrListCount() > 0) {
                            for(int i = 0 ; i < offlineFileCount; i ++) {
                                IMBaseDefine.OfflineFileInfo info = rsp.getOfflineFileList(i);
                                TransferFileTask task = new TransferFileTask(info.getFromUserId(),uid,info.getTaskId(),ip,port,IMBaseDefine.TransferFileType.FILE_TYPE_OFFLINE_VALUE,false);
                                task.setFileName(info.getFileName());
                                task.setDataLength(info.getFileSize());
                                offlineFileTasks.add(task);
                            }
                        }
                    }
                    triggerEvent(TransferFileEvent.REQ_OFFLINEFILE_LIST);

                    //rsp.getIpAddrListCount()

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            @Override
            public void onFaild() {

            }

            @Override
            public void onTimeout() {

            }
        });
    }


    public void sendOfflineFileToUser(final File file, final int fromUser, final int toId, final TransferFileTask.TransferCallBack callback) {
        IMFile.IMFileReq req = IMFile.IMFileReq.newBuilder()
                .setFileName(file.getName()).setFileSize((int) file.length()).setFromUserId(fromUser).setTransMode(IMBaseDefine.TransferFileType.FILE_TYPE_OFFLINE).setToUserId(toId).build();
        int sid = IMBaseDefine.ServiceID.SID_FILE_VALUE;
        int cid = IMBaseDefine.FileCmdID.CID_FILE_REQUEST_VALUE;
        IMSocketManager.instance().sendRequest(req, sid, cid, new Packetlistener() {
            @Override
            public void onSuccess(Object response) {
                try {
                    IMFile.IMFileRsp rsp = IMFile.IMFileRsp.parseFrom((CodedInputStream)response);
                    int transMode = rsp.getTransMode().getNumber();
                    if(rsp.getIpAddrListCount() > 0) {
                        IMBaseDefine.IpAddr addr =  rsp.getIpAddrList(0);
                        TransferFileTask task = new TransferFileTask(fromUser,toId,rsp.getTaskId(),addr.getIp(),addr.getPort(),transMode,true);
                        try {
                            if(callback != null) {
                                task.setCallBack(callback);
                            }
                            task.setTargetFile(file);
                            task.startWork();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    }else {

                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            @Override
            public void onFaild() {

            }

            @Override
            public void onTimeout() {

            }
        });

    }


}

package com.mogujie.tt.ui.activity;

import android.os.Bundle;
import android.text.Layout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.mogujie.tt.R;
import com.mogujie.tt.imservice.event.TransferFileEvent;
import com.mogujie.tt.imservice.manager.IMLoginManager;
import com.mogujie.tt.imservice.manager.IMTransferFileManager;
import com.mogujie.tt.imservice.network.TransferFileTask;
import com.mogujie.tt.ui.base.TTBaseActivity;

import java.io.File;

import java.util.List;

import de.greenrobot.event.EventBus;

public class ShowTransferFileActivity extends TTBaseActivity {

    private ListView contentListView;
    private ItemAdapter itemAdapter;
    private List<TransferFileTask> tasks;

    private int currentUid;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        currentUid = getIntent().getIntExtra("uid",0);

        itemAdapter = new ItemAdapter();
        contentListView = new ListView(this);
        contentListView.setAdapter(itemAdapter);
        topContentView.addView(contentListView,new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.MATCH_PARENT));
        setTitle("文件传输");
        EventBus.getDefault().register(this);
        IMTransferFileManager.instance().loadHasOfflineFile(IMLoginManager.instance().getLoginId());
    }





    public void onEventMainThread(TransferFileEvent event) {
        if(currentUid > 0) {
            tasks = IMTransferFileManager.instance().getOfflineFileTaskByUID(currentUid);
            itemAdapter.notifyDataSetChanged();
        }
    }


    @Override
    protected void onDestroy() {
        super.onDestroy();
        EventBus.getDefault().unregister(this);
    }

    public class ItemAdapter extends BaseAdapter {

        @Override
        public int getCount() {
            if(tasks != null) {
                return tasks.size();
            }
            return 0;
        }

        @Override
        public Object getItem(int i) {
            return null;
        }

        @Override
        public long getItemId(int i) {
            return 0;
        }

        private void bindDataForView(View view, int position) {
            final TransferFileTask task = tasks.get(position);
            TextView titleView = (TextView) view.findViewById(R.id.item_title_text);
            titleView.setText(task.getFileName());
            final Button button = (Button) view.findViewById(R.id.item_action_button);
            button.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    task.setCallBack(new TransferFileTask.TransferCallBack() {
                        @Override
                        public void onStart(TransferFileTask task) {
                            button.post(new Runnable() {
                                @Override
                                public void run() {
                                    button.setText("开始下载");
                                }
                            });
                        }

                        @Override
                        public void onProgressing(TransferFileTask task, float progress) {
                            final String progressTitle =progress * 100 + "%";
                            button.post(new Runnable() {
                                @Override
                                public void run() {
                                    button.setText(progressTitle);
                                }
                            });
                        }

                        @Override
                        public void onFinished(final TransferFileTask task) {
                            button.post(new Runnable() {
                                @Override
                                public void run() {
                                    button.setText("下载完成");
                                    Toast.makeText(ShowTransferFileActivity.this, "下载到了:" + task.getTargetFilePath(), Toast.LENGTH_SHORT).show();
                                }
                            });
                        }

                        @Override
                        public void onCanceled(TransferFileTask task, String msg) {

                        }
                    });
                    try {

                        String basePath = "/sdcard/Download/" + getPackageName() + "/";
                        File file = new File(basePath);
                        if(!file.exists()) {
                            file.mkdirs();
                        }
                        task.setTargetFilePath(basePath+task.getFileName());//设置下载到的路径
                        task.startWork();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                }
            });
        }

        @Override
        public View getView(int i, View view, ViewGroup viewGroup) {

            if(view == null) {
                view = LayoutInflater.from(getBaseContext()).inflate(R.layout.transfer_file_show_item_layout,null);
            }

            bindDataForView(view, i);
            return view;
        }
    }


}

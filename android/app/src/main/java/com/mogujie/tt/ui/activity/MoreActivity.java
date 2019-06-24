package com.mogujie.tt.ui.activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;

import com.mogujie.tt.DB.sp.SystemConfigSp;
import com.mogujie.tt.R;
import com.mogujie.tt.config.UrlConstant;

/**
 * author: 蒋超
 * date: On 2018/10/31
 * 版权：蒋超
 * 功能：设置服务器IP和端口
 */
public class MoreActivity extends AppCompatActivity implements View.OnClickListener{
	private static final String TAG = "MoreActivity";

    private ImageButton back;
    private Button save;
    private EditText IP, PORT;
    //ADD-S lijinfeng 20181210
    private EditText DevID;
    //ADD-E lijinfeng 20181210
    private TextView textfanhui;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        /*允许窗口伸展到屏幕之外*/
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS);
        setContentView(R.layout.activity_more);
        initView();
        initData();
        initListener();

    }

    /*初始化view*/
    public void initView() {
        back = findViewById(R.id.back);
        save = findViewById(R.id.save);
        back.setOnClickListener(this);
        save.setOnClickListener(this);
        IP = findViewById(R.id.serverIP);
        PORT = findViewById(R.id.serverPort);
        //ADD-S lijinfeng 20181210
        DevID = findViewById(R.id.DevID);
        //ADD-E lijinfeng 20181210
        textfanhui = findViewById(R.id.textfanhui);
        if (!TextUtils.isEmpty(SystemConfigSp.instance().getStrConfig(SystemConfigSp.SysCfgDimension.IP)))
        {
            IP.setText(SystemConfigSp.instance().getStrConfig(SystemConfigSp.SysCfgDimension.IP));
        }

        if (!TextUtils.isEmpty(SystemConfigSp.instance().getStrConfig(SystemConfigSp.SysCfgDimension.PORT)))
        {
            PORT.setText(SystemConfigSp.instance().getStrConfig(SystemConfigSp.SysCfgDimension.PORT));
        }
        //ADD-S lijinfeng 20181210
//        DevID.setText(LoginSp.instance().getKEY_DEFAULT_DEVID());
        //ADD-E lijinfeng 20181210
    }

    /**
     * 初始化数据
     */
    public void initData() {

    }

    /**
     * 初始化监听器
     */
    public void initListener() {
        back.setOnClickListener(this);
        save.setOnClickListener(this);
        textfanhui.setOnClickListener(this);
    }


    @Override
    public void onClick(View v) {
        switch (v.getId())
        {
            case R.id.back:
                finish();
                break;
            case R.id.save:
                Intent mIntent=new Intent();//没有任何参数（意图），只是用来传递数据
                mIntent.putExtra("service_ip", IP.getText().toString());
                mIntent.putExtra("service_port", PORT.getText().toString());
                //ADD-S lijinfeng 20181210
//                LoginSp.instance().setKEY_DEFAULT_DEVID(DevID.getText().toString());
                //ADD-E lijinfeng 20181210
                setResult(RESULT_OK,mIntent);
                finish();
                break;
            case R.id.textfanhui:
                finish();
                break;
        }
    }
}

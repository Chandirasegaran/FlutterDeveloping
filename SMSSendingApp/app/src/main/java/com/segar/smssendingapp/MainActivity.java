package com.segar.smssendingapp;
import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import android.telephony.SmsManager;

public class MainActivity extends AppCompatActivity {
    private static final int SMS_PERMISSION_CODE = 101;
    private EditText phoneEditText, msgEditText;
    private Button sendButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        phoneEditText = findViewById(R.id.phone);
        msgEditText = findViewById(R.id.msg);
        sendButton = findViewById(R.id.send);

        sendButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendSMS();
            }
        });

        // Request SMS permission if not granted
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.SEND_SMS) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.SEND_SMS}, SMS_PERMISSION_CODE);
        }
    }

    private void sendSMS() {
        String phoneNumber = phoneEditText.getText().toString();
        String message = msgEditText.getText().toString();

        try {
            SmsManager smsManager = SmsManager.getDefault();
            smsManager.sendTextMessage(phoneNumber, null, message, null, null);
            Toast.makeText(this, "SMS Sent!", Toast.LENGTH_SHORT).show();
        } catch (Exception e) {
            Toast.makeText(this, "SMS Failed to Send!", Toast.LENGTH_SHORT).show();
            e.printStackTrace();
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);

        if (requestCode == SMS_PERMISSION_CODE) {
            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                // Permission granted, you can send SMS
            } else {
                Toast.makeText(this, "SMS permission denied!", Toast.LENGTH_SHORT).show();
            }
        }
    }
}



//
//import androidx.appcompat.app.AppCompatActivity;
//
//import android.os.Bundle;
//

//public class MainActivity extends AppCompatActivity {
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//    }
//}
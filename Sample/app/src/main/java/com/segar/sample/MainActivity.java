package com.segar.sample;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
Button btn;
EditText et;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btn=findViewById(R.id.button);
        et=findViewById(R.id.editTextTextEmailAddress);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String mail=et.getText().toString();
                Intent intent=new Intent(MainActivity.this,MainActivity2.class);
                intent.putExtra("key",mail);
                startActivity(intent);
            }

        });

    }
}
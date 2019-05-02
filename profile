package com.example.main_screen;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

public class profile extends AppCompatActivity {

    int cal;

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);

        ListView listView;

        String [] profilelist;


        Button calorie = findViewById(R.id.calorie);
        TextView ft = findViewById(R.id.hft);
        TextView in = findViewById(R.id.hin);
        
        //calculates the users daily calorie intake
        cal = (14 * 70) + (5* 174) - (6 * 22) + 388;

        //once pressed this will print the user's recommended daily calorie intake everyday
        calorie.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getApplicationContext(),"You must consume " + Integer.toString(cal) + " Everyday!",Toast.LENGTH_SHORT).show();
            }
        });

        //will print a list with the users data
        listView = (ListView) findViewById(R.id.listview_profile);
        profilelist = getResources().getStringArray(R.array.profile_list);

        ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, profilelist);
        listView.setAdapter(arrayAdapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                view.setSelected(true);
            }
        });

        //sets up the navigation bar
        BottomNavigationView navigation = findViewById(R.id.navigation);

        navigation.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                switch (menuItem.getItemId()) {
                    case R.id.navigation_workouts:
                        Intent int1 = new Intent(profile.this, workouts.class);
                        startActivity(int1);
                        break;
                    case R.id.navigation_home:
                        Intent int2 = new Intent(profile.this, main_menu.class);
                        startActivity(int2);
                        break;
                }
                return false;
            }
        });

    }
}

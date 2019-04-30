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

public class profile extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);

        ListView listView;

        String [] profilelist;

        Button update = findViewById(R.id.update_info);

        //sets the list view of the profile information
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


        BottomNavigationView navigation = findViewById(R.id.navigation);

        //sets the navigation bar
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
      
        //if pressed this will take the user to update their profile
        update.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent int1 = new Intent(profile.this, uprofile.class);
                startActivity(int1);

            }
        });
    }
}

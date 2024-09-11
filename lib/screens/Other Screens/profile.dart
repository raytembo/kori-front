import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Open menu
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Picture Section
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Action to change profile picture
                    },
                    child: Text(
                      'Change Profile Picture',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // E-mail Address
            ListTile(
              leading: Icon(Icons.email, color: Colors.teal),
              title: Text(
                'Email Address',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('amyortega@student.edu'),
              onTap: () {
                // Email change logic
              },
            ),

            // Student ID
            ListTile(
              leading: Icon(Icons.perm_identity, color: Colors.teal),
              title: Text(
                'Student ID',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('202400123'),
            ),

            // Program
            ListTile(
              leading: Icon(Icons.school, color: Colors.teal),
              title: Text(
                'Program',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Bachelor of Science in Computer Science'),
            ),

            // Year of Study
            ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.teal),
              title: Text(
                'Year of Study',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Year 2'),
            ),

            SizedBox(height: 20),

            // Notification Settings
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Notification Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),

            SwitchListTile(
              title: Text(
                'Grade Updates',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Receive notifications when grades are posted'),
              value: true,
              onChanged: (bool value) {
                // Handle switch
              },
            ),

            SwitchListTile(
              title: Text(
                'Assignment Deadlines',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Get reminders for upcoming assignments'),
              value: false,
              onChanged: (bool value) {
                // Handle switch
              },
            ),

            SwitchListTile(
              title: Text(
                'Announcements',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Be notified when new announcements are made'),
              value: true,
              onChanged: (bool value) {
                // Handle switch
              },
            ),

            SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Save changes
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text('Save Changes', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

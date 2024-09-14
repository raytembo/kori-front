import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Action to change profile picture
                    },
                    child: const Text(
                      'Change Profile Picture',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // E-mail Address
            ListTile(
              leading: const Icon(Icons.email, color: Colors.teal),
              title: const Text(
                'Email Address',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('amyortega@student.edu'),
              onTap: () {
                // Email change logic
              },
            ),

            // Student ID
            const ListTile(
              leading: Icon(Icons.perm_identity, color: Colors.teal),
              title: Text(
                'Student ID',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('202400123'),
            ),

            // Program
            const ListTile(
              leading: Icon(Icons.school, color: Colors.teal),
              title: Text(
                'Program',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Bachelor of Science in Computer Science'),
            ),

            // Year of Study
            const ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.teal),
              title: Text(
                'Year of Study',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Year 2'),
            ),

            const SizedBox(height: 10),

            // Notification Settings
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Notification Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),

            SwitchListTile(
              activeColor: Colors.teal,
              title: const Text(
                'Grade Updates',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Receive notifications when grades are posted'),
              value: true,
              onChanged: (bool value) {
                // Handle switch
              },
            ),

            SwitchListTile(
              activeColor: Colors.teal,
              title: const Text(
                'Assignment Deadlines',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Get reminders for upcoming assignments'),
              value: false,
              onChanged: (bool value) {
                // Handle switch
              },
            ),

            SwitchListTile(
              activeColor: Colors.teal,
              title: const Text(
                'Announcements',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Be notified when new announcements are made'),
              value: true,
              onChanged: (bool value) {
                // Handle switch
              },
            ),

            const SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Save changes
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Save Changes', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

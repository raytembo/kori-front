import 'package:flutter/material.dart';
import 'package:untitled/screens/Other%20Screens/coursereg.dart';
import 'package:untitled/screens/Other%20Screens/transcript.dart';
import 'package:untitled/screens/Other%20Screens/assignments.dart';
import 'package:untitled/screens/Other%20Screens/grades.dart';
import 'package:untitled/screens/Other%20Screens/profile.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0), // Add padding to space out the items
        children: [
          ListTile(
            title: const Text('Your Profile'),
            onTap: () {
              // Navigate to Profile Screen
              Navigator.push(
                context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
            },
          ),
          ListTile(
            title: const Text('Transcript'),
            onTap: () {
              // Navigate to Course Registration Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TranscriptScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Saved Tags'),
            onTap: () {
              // Navigate to Saved Tags Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlanDetailsScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Course Registration'),
            onTap: () {
              // Navigate to Course Registration Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CourseRegistrationScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Saved Cards'),
            onTap: () {
              // Navigate to Saved Cards Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GradeScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Notifications & Emails'),
            onTap: () {
              // Navigate to Notifications & Emails Screen
            },
          ),
          const Divider(), // Divider for separation of sections
          ListTile(
            title: const Text('Application Password'),
            onTap: () {
              // Navigate to Application Password Screen
            },
          ),
          ListTile(
            title: const Text('Verification OTP'),
            onTap: () {
              // Navigate to Verification OTP Screen
            },
          ),
          const Divider(), // Another divider to separate content sections
          ListTile(
            title: const Text('Contact Support'),
            onTap: () {
              // Navigate to Contact Support Screen
            },
          ),
          ListTile(
            title: const Text('About Recharge Fastag'),
            onTap: () {
              // Navigate to About Recharge Fastag Screen
            },
          ),
          ListTile(
            title: const Text('Legal'),
            onTap: () {
              // Navigate to Legal Screen
            },
          ),
          ListTile(
            title: const Text('Log Out', style: TextStyle(color: Colors.red),),
            onTap: () {
              // Navigate to Legal Screen
            },
          ),
        ],
      ),
    );
  }
}

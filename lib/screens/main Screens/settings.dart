import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Your Profile'),
            onTap: () {
              // Navigate to Profile Screen
            },
          ),
          ListTile(
            title: Text('Saved Tags'),
            onTap: () {
              // Navigate to Saved Tags Screen
            },
          ),
          ListTile(
            title: Text('Saved Cards'),
            onTap: () {
              // Navigate to Saved Cards Screen
            },
          ),
          ListTile(
            title: Text('Notifications & Emails'),
            onTap: () {
              // Navigate to Notifications & Emails Screen
            },
          ),
          Divider(),
          ListTile(
            title: Text('Application Password'),
            onTap: () {
              // Navigate to Application Password Screen
            },
          ),
          ListTile(
            title: Text('Verification OTP'),
            onTap: () {
              // Navigate to Verification OTP Screen
            },
          ),
          Divider(),
          ListTile(
            title: Text('Contact Support'),
            onTap: () {
              // Navigate to Contact Support Screen
            },
          ),
          ListTile(
            title: Text('About Recharge Fastag'),
            onTap: () {
              // Navigate to About Recharge Fastag Screen
            },
          ),
          ListTile(
            title: Text('Legal'),
            onTap: () {
              // Navigate to Legal Screen
            },
          ),
        ],
      ),
    );
  }
}

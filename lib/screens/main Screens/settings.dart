import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Your Profile'),
            onTap: () {
              // Navigate to Profile Screen
            },
          ),
          ListTile(
            title: const Text('Saved Tags'),
            onTap: () {
              // Navigate to Saved Tags Screen
            },
          ),
          ListTile(
            title: const Text('Saved Cards'),
            onTap: () {
              // Navigate to Saved Cards Screen
            },
          ),
          ListTile(
            title: const Text('Notifications & Emails'),
            onTap: () {
              // Navigate to Notifications & Emails Screen
            },
          ),
          const Divider(),
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
          const Divider(),
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
        ],
      ),
    );
  }
}

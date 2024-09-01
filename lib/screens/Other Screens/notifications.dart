import 'package:flutter/material.dart';

class NotificationsEmailsScreen extends StatefulWidget {
  @override
  _NotificationsEmailsScreenState createState() =>
      _NotificationsEmailsScreenState();
}

class _NotificationsEmailsScreenState extends State<NotificationsEmailsScreen> {
  bool tollNotification = false;
  bool lowBalanceNotification = false;
  bool tollEmail = false;
  bool lowBalanceEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications & Emails'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            activeColor: Colors.teal,
            title: Text('Toll'),
            subtitle: Text(
                'Whenever a toll is deducted, you will receive a notification.'),
            value: tollNotification,
            onChanged: (bool value) {
              setState(() {
                tollNotification = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Low Balance'),
            activeColor: Colors.teal,
            subtitle: Text(
                'Whenever your tag balance gets below ₹100, you will receive a notification.'),
            value: lowBalanceNotification,
            onChanged: (bool value) {
              setState(() {
                lowBalanceNotification = value;
              });
            },
          ),
          Divider(),
          SwitchListTile(
            activeColor: Colors.teal,
            title: Text('Toll'),
            subtitle:
            Text('Whenever a toll is deducted, you will receive an email.'),
            value: tollEmail,
            onChanged: (bool value) {
              setState(() {
                tollEmail = value;
              });
            },
          ),
          SwitchListTile(
            activeColor: Colors.teal,
            title: Text('Low Balance'),
            subtitle: Text(
                'Whenever your tag balance gets below ₹100, you will receive an email.'),
            value: lowBalanceEmail,
            onChanged: (bool value) {
              setState(() {
                lowBalanceEmail = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

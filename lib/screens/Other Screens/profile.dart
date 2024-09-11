import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile Settings'),
        backgroundColor: Colors.lightBlueAccent,
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
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.add, size: 40, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tap the big circle to change your profile image, or upload a new one',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text(
                'E-mail Address',
                style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('amyortega@gmail.com'),
              onTap: () {
                // Email change logic
              },
            ),
            ListTile(
              title: Text(
                'Choose Currency',
                style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
              ),
              subtitle: DropdownButton<String>(
                value: 'US Dollars',
                items: <String>['US Dollars', 'Euro', 'British Pound']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
            ListTile(
              title: Text(
                'Figures backed by XD Currency Converter',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SwitchListTile(
              title: Text(
                'New Arrivals',
                style: TextStyle(color: Colors.lightBlueAccent),
              ),
              value: true,
              onChanged: (bool value) {
                // Handle switch
              },
            ),
            SwitchListTile(
              title: Text(
                'Discounts',
                style: TextStyle(color: Colors.lightBlueAccent),
              ),
              value: false,
              onChanged: (bool value) {
                // Handle switch
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Choose what kind of notifications you would like to receive',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Save changes
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

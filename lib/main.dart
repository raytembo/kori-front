import 'package:flutter/material.dart';
import 'package:untitled/Essentials/navbar.dart';


void main() {runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School LMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navbar(),
    );
  }
}


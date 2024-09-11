import 'package:flutter/material.dart';
import 'package:untitled/Essentials/navbar.dart';


void main() {runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School LMS',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Navbar(),
    );
  }
}


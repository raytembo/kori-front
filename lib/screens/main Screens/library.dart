import 'package:flutter/material.dart';

class LIbraryScreen extends StatefulWidget {
  const LIbraryScreen({super.key});

  @override
  State<LIbraryScreen> createState() => _LIbraryScreenState();
}

class _LIbraryScreenState extends State<LIbraryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Library"),
    );
  }
}

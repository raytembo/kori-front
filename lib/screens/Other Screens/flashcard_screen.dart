import 'package:flutter/material.dart';

class FlashcardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Flashcards'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'Flashcards will be displayed here.',
          style: TextStyle(fontSize: 20, color: Colors.black87),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:math';

class TimetableScreen extends StatelessWidget {
  final List<String> selectedSubjects;

  TimetableScreen({required this.selectedSubjects});

  final List<Color> _colors = [
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.blue,
    Colors.cyan,
    Colors.pink,
    Colors.teal
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This Week's Timetable"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Add task button pressed
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: selectedSubjects.length,
        itemBuilder: (context, index) {
          final subject = selectedSubjects[index];
          final color = _colors[Random().nextInt(_colors.length)];  // Assign random color

          return ScheduleCard(
            time: "${7 + index}:00",  // Example: Assigning a different time for each subject
            title: subject,
            color: color,
          );
        },
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String time;
  final String title;
  final Color color;

  ScheduleCard({required this.time, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(time, style: TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: Card(
              color: color,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(title, style: TextStyle(fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

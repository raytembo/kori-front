import 'package:flutter/material.dart';

class TranscriptScreen extends StatefulWidget {
  @override
  _TranscriptScreenState createState() => _TranscriptScreenState();
}

class _TranscriptScreenState extends State<TranscriptScreen> {
  String selectedTab = 'GPA'; // Default to GPA tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Transcript'),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GPA/SPA/Points Tab Selector
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SPA Button
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedTab = 'SPA';
                        });
                      },
                      child: Text(
                        'SPA',
                        style: TextStyle(
                          color: selectedTab == 'SPA' ? Colors.white : Colors.white70,
                          fontWeight: selectedTab == 'SPA' ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // GPA Button
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedTab = 'GPA';
                        });
                      },
                      child: Text(
                        'GPA',
                        style: TextStyle(
                          color: selectedTab == 'GPA' ? Colors.white : Colors.white70,
                          fontWeight: selectedTab == 'GPA' ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Points Button
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedTab = 'Points';
                        });
                      },
                      child: Text(
                        'Points',
                        style: TextStyle(
                          color: selectedTab == 'Points' ? Colors.white : Colors.white70,
                          fontWeight: selectedTab == 'Points' ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // GPA/SPA/Points Summary
              Text(
                selectedTab == 'GPA' ? 'Cumulative GPA' : selectedTab == 'SPA' ? 'Semester SPA' : 'Total Points',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Credits Earned',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '32',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'GPA',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '3.75',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Letter Grade',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'A',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // List of Courses
              Expanded(
                child: ListView(
                  children: [
                    CourseItem(
                      courseName: 'Data Structures and Algorithms',
                      credits: 3,
                      grade: 'A',
                      semester: 'Fall 2023',
                    ),
                    CourseItem(
                      courseName: 'Operating Systems',
                      credits: 3,
                      grade: 'B+',
                      semester: 'Fall 2023',
                    ),
                    CourseItem(
                      courseName: 'Database Management Systems',
                      credits: 4,
                      grade: 'A-',
                      semester: 'Spring 2023',
                    ),
                    // Add more CourseItem widgets for other courses
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget for each course item in the transcript
class CourseItem extends StatelessWidget {
  final String courseName;
  final int credits;
  final String grade;
  final String semester;

  const CourseItem({
    Key? key,
    required this.courseName,
    required this.credits,
    required this.grade,
    required this.semester,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(courseName, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Credits: $credits | Semester: $semester'),
        trailing: Text(
          grade,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: grade == 'A' ? Colors.green : Colors.orange,
          ),
        ),
      ),
    );
  }
}

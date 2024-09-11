import 'package:flutter/material.dart';
import 'package:untitled/screens/Other%20Screens/flashcard_screen.dart';

class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CourseDetailsScreen(),
    );
  }
}

class CourseDetailsScreen extends StatelessWidget {

  int enrollCounter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: const Text('UI UX Design'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/ui.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Figma UI UX Design Essentials',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.1, // Example progress value
                      backgroundColor: Colors.grey[300],
                      color: Colors.teal,
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.note, color: Colors.teal),
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FlashcardScreen()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TabBarSection(),
                    const Padding(
                      padding: EdgeInsets.all(16.0),

                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            backgroundColor: Colors.teal,
          ),
          onPressed: () {

            if(enrollCounter <1){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Enrolled'),
                ),
              );

            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("You've Already Enrolled"),
                ),
              );
            }
            enrollCounter++;
          },
          child: const Text(
            'Enroll Now',
            style: TextStyle(
                fontSize: 18,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicator: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black54,
            tabs: const [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Tab(text: 'Playlist (22)'),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Tab(text: 'Description'),
              ),
            ],
          ),
          SizedBox(
            height: 200, // Adjust the height as needed
            child: TabBarView(
              children: [
                // Content for the Playlist tab
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: const [
                    LessonTile(title: 'Introduction', duration: '2 Min 18 Sec', isCompleted: true),
                    LessonTile(title: 'What is UI UX design?', duration: '18 Min 46 Sec', isLocked: true),
                    LessonTile(title: 'How to make wireframe', duration: '20 Min 58 Sec', isLocked: true),
                    LessonTile(title: 'Your first design', duration: '15 Min 30 Sec', isLocked: true),
                  ],
                ),
                // Content for the Description tab
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'This course covers the fundamentals of UI/UX design using Figma. '
                        'You will learn how to create wireframes, design your first project, and more.',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LessonTile extends StatelessWidget {
  final String title;
  final String duration;
  final bool isCompleted;
  final bool isLocked;

  const LessonTile({
    required this.title,
    required this.duration,
    this.isCompleted = false,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isCompleted ? Icons.play_circle_fill : Icons.lock,
        color: isCompleted ? Colors.green : Colors.grey,
      ),
      title: Text(title),
      subtitle: Text(duration),
      trailing: isCompleted ? const Icon(Icons.check_circle, color: Colors.green) : null,
    );
  }
}



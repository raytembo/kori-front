import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('UI UX Design'),
        backgroundColor: Colors.blueAccent,
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
                  'assets/course_image.jpg', // Replace with your actual image path
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Figma UI UX Design Essentials',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.4, // Example progress value
                      backgroundColor: Colors.grey[300],
                      color: Colors.blueAccent,
                      minHeight: 8,
                    ),
                  ),
                  SizedBox(width: 16),
                  IconButton(
                    icon: Icon(Icons.note, color: Colors.blueAccent),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FlashcardScreen()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TabBarSection(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          LessonTile(title: 'Introduction', duration: '2 Min 18 Sec', isCompleted: true),
                          LessonTile(title: 'What is UI UX design?', duration: '18 Min 46 Sec', isLocked: true),
                          LessonTile(title: 'How to make wireframe', duration: '20 Min 58 Sec', isLocked: true),
                          LessonTile(title: 'Your first design', duration: '15 Min 30 Sec', isLocked: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          onPressed: () {},
          child: Text(
            'Enroll Now',
            style: TextStyle(fontSize: 18),
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
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(15.0),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(text: 'Playlist (22)'),
              Tab(text: 'Description'),
            ],
          ),
          SizedBox(
            height: 200, // Adjust the height as needed
            child: TabBarView(
              children: [
                // Content for the Playlist tab
                ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    LessonTile(title: 'Introduction', duration: '2 Min 18 Sec', isCompleted: true),
                    LessonTile(title: 'What is UI UX design?', duration: '18 Min 46 Sec', isLocked: true),
                    LessonTile(title: 'How to make wireframe', duration: '20 Min 58 Sec', isLocked: true),
                    LessonTile(title: 'Your first design', duration: '15 Min 30 Sec', isLocked: true),
                  ],
                ),
                // Content for the Description tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
      trailing: isCompleted ? Icon(Icons.check_circle, color: Colors.green) : null,
    );
  }
}

class FlashcardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Flashcards will be displayed here.',
          style: TextStyle(fontSize: 24, color: Colors.black87),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GradeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 10),

              // Welcome Back Section
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Zaire Carder',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Progress Card (Progress this year)
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Here it is',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'Your progress this year',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Action for View Transcript
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'View Transcript',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Circular Progress Indicator
                    CircularProgressIndicator(
                      value: 0.8, // 80% completion
                      strokeWidth: 6,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      backgroundColor: Colors.white24,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Time Section (Semester Info)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Semester Overview',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Plan Cards (Current Semester and Last Semester)
              Row(
                children: [
                  Expanded(
                    child: PlanCard(
                      icon: Icons.school,
                      planType: 'This Semester',
                      plansRemaining: 3, // Replace with relevant data
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: PlanCard(
                      icon: Icons.history_edu,
                      planType: 'Last Semester',
                      plansRemaining: 8, // Replace with relevant data
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Grades Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grades',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Action for See all grades
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Grades List (Subjects and Scores)
              Expanded(
                child: ListView(
                  children: [
                    OngoingPlanItem(
                      title: 'Mathematics',
                      isCompleted: true,
                      subtasks: [
                        {'name': 'Test 1: 85%', 'isDone': true},
                        {'name': 'Test 2: 90%', 'isDone': true},
                        {'name': 'Final Exam: 92%', 'isDone': true},
                      ],
                    ),
                    OngoingPlanItem(
                      title: 'Science',
                      isCompleted: true,
                      subtasks: [
                        {'name': 'Test 1: 88%', 'isDone': true},
                        {'name': 'Test 2: 82%', 'isDone': true},
                        {'name': 'Final Exam: 89%', 'isDone': true},
                      ],
                    ),
                    OngoingPlanItem(
                      title: 'History',
                      isCompleted: false,
                      subtasks: [
                        {'name': 'Test 1: 75%', 'isDone': true},
                        {'name': 'Test 2: 80%', 'isDone': false},
                      ],
                    ),
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

class PlanCard extends StatelessWidget {
  final IconData icon;
  final String planType;
  final int plansRemaining;

  const PlanCard({
    Key? key,
    required this.icon,
    required this.planType,
    required this.plansRemaining,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(
            planType,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          Text('$plansRemaining Courses Completed'),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              // Action for Go to Plan
            },
            child: Text('View Details'),
          ),
        ],
      ),
    );
  }
}

class OngoingPlanItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final List<Map<String, dynamic>> subtasks;

  const OngoingPlanItem({
    Key? key,
    required this.title,
    required this.isCompleted,
    required this.subtasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: subtasks.map((subtask) {
                return Row(
                  children: [
                    Icon(
                      subtask['isDone']
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: subtask['isDone'] ? Colors.green : Colors.grey,
                    ),
                    SizedBox(width: 8),
                    Text(
                      subtask['name'],
                      style: TextStyle(
                        decoration: subtask['isDone']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

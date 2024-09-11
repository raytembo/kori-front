import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // Add intl package to handle date formatting
import 'package:untitled/screens/main%20Screens/settings.dart';

class PlanDetailsScreen extends StatefulWidget {
  @override
  _PlanDetailsScreenState createState() => _PlanDetailsScreenState();
}

class _PlanDetailsScreenState extends State<PlanDetailsScreen> {
  int selectedDayIndex = DateTime.now().weekday - 1; // Get the current day index (0 = Monday)
  List<DateTime> currentWeek = [];

  @override
  void initState() {
    super.initState();
    _generateCurrentWeek();
  }

  void _generateCurrentWeek() {
    // Calculate the start of the week (Monday)
    DateTime today = DateTime.now();
    DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));

    // Populate the list with dates for the current week (Monday to Sunday)
    currentWeek = List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  void _onDaySelected(int index) {
    setState(() {
      selectedDayIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Assignments",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Action for more options
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: currentWeek.length,
                itemBuilder: (context, index) {
                  DateTime date = currentWeek[index];
                  String dayName = DateFormat.E().format(date); // e.g., Mon, Tue
                  String dayNumber = DateFormat.d().format(date); // e.g., 20, 21

                  return GestureDetector(
                    onTap: () => _onDaySelected(index),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: selectedDayIndex == index ? Colors.black : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            dayName,
                            style: TextStyle(
                              color: selectedDayIndex == index ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            dayNumber,
                            style: TextStyle(
                              color: selectedDayIndex == index ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Weekly Report",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WorkoutMetricWidget(icon: Icons.local_fire_department, value: "13", label: "Complete"),
                WorkoutMetricWidget(icon: Icons.bolt, value: "11", label: "Streak"),
                WorkoutMetricWidget(icon: Icons.warning_amber_rounded, value: "1", label: "Due"),
                WorkoutMetricWidget(icon: Icons.close_outlined, value: "1", label: "Past"),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Activity",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ActivityWidget(title: "Java Prog 15 min quiz", isChecked: true),
                  ActivityWidget(title: "Java 5", isChecked: true),
                  ActivityWidget(title: "Linear Algebra", isChecked: false),
                  ActivityWidget(title: "Weight lifting", isChecked: false),
                  ActivityWidget(title: "Probs and stats", isChecked: false),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  // Action for add button
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutMetricWidget extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const WorkoutMetricWidget({Key? key, required this.icon, required this.value, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange, size: 30),
        SizedBox(height: 5),
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class ActivityWidget extends StatelessWidget {
  final String title;
  final bool isChecked;

  const ActivityWidget({Key? key, required this.title, required this.isChecked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
        color: isChecked ? Colors.green : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          color: isChecked ? Colors.grey : Colors.black,
        ),
      ),
      onTap: () {
        // Action when tapping activity
      },
    );
  }
}

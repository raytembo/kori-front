import 'package:flutter/material.dart';
import 'package:untitled/screens/Other%20Screens/timetable.dart';

class CourseRegistrationScreen extends StatefulWidget {
  const CourseRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<CourseRegistrationScreen> createState() => _CourseRegistrationScreenState();
}

class _CourseRegistrationScreenState extends State<CourseRegistrationScreen> {
  List<String> _selectedCourses = [];
  List<String> _availableCourses = [
    'Introduction to Programming',
    'Data Structures and Algorithms',
    'Web Development',
    'Mobile App Development',
    'Database Systems',
    'Artificial Intelligence',
    'Machine Learning',
    'Computer Networks',
    'Software Engineering',
    'Computer Graphics',
    'Operating Systems',
    'Cybersecurity',
    'Cloud Computing',
    'Human-Computer Interaction',
  ];

  List<String> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    _filteredCourses = List.from(_availableCourses);
  }

  void _searchCourse(String query) {
    setState(() {
      _filteredCourses = _availableCourses
          .where((course) => course.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _clearSelection() {
    setState(() {
      _selectedCourses.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Registration'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Courses',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: _searchCourse,
            ),
          ),
          Expanded(
            child: _filteredCourses.isEmpty
                ? Center(child: Text('No courses found'))
                : ListView.builder(
              itemCount: _filteredCourses.length,
              itemBuilder: (context, index) {
                final course = _filteredCourses[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: CheckboxListTile(
                    title: Text(course),
                    value: _selectedCourses.contains(course),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _selectedCourses.add(course);
                        } else {
                          _selectedCourses.remove(course);
                        }
                      });
                    },
                    activeColor: Colors.teal,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _selectedCourses.isNotEmpty ? _clearSelection : null,
                  child: const Text('Clear All'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, // Button color
                  ),
                ),
                ElevatedButton(
                  onPressed: _selectedCourses.isEmpty
                      ? null
                      : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TimetableScreen(
                          selectedSubjects: _selectedCourses,
                        ),
                      ),
                    );
                  },
                  child: const Text('View Timetable'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Button color
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

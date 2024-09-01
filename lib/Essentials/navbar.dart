import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:untitled/screens/main%20Screens/home_screen.dart';
import 'package:untitled/screens/main%20Screens/library.dart';
import 'package:untitled/screens/main%20Screens/membership.dart';
import 'package:untitled/screens/main%20Screens/settings.dart';
import 'package:untitled/screens/main%20Screens/tasks.dart';


class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  int _selectedItemPosition = 0;

  final List<Widget> _pages = [
     HomeScreen(),
     const LIbraryScreen(),
    const TasksScreen(),
    const MembershipScreen(),
    SettingsScreen()

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedItemPosition],
        bottomNavigationBar: SnakeNavigationBar.color(
          backgroundColor: Colors.transparent,
          behaviour: SnakeBarBehaviour.pinned,
          snakeShape: SnakeShape.indicator,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              )),
          padding: const EdgeInsets.all(8),
          snakeViewColor: Colors.teal,
          selectedItemColor: Colors.teal,
          unselectedItemColor: const Color.fromRGBO(76, 76, 71, 100),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: _selectedItemPosition,
          onTap: (index) => setState(() => _selectedItemPosition = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ));

  }
}

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime? _selectedDay;
  DateTime _focusDay = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: TableCalendar(
          locale: 'en_us',
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusDay,
          selectedDayPredicate: (day)=>isSameDay(_selectedDay, day),
          onDaySelected: _onDaySelected,
        ),
      )
    );
  }
  void _onDaySelected(selectedDay, focusedDay){
    if(isSameDay(_selectedDay, selectedDay)){
      setState(() {
        _selectedDay = selectedDay;
        _focusDay = focusedDay;
      });
    }
  }
}

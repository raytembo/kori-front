import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Essentials/event.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusDay = DateTime.now();

  void selectMethod(DateTime day, DateTime focusedDay){
    setState(() {
      _focusDay = day;
    });
  }
  Map<DataTable, List<Event>>events = {};

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            Text("Schedule", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: TableCalendar(
                availableGestures: AvailableGestures.all,
                headerStyle: const HeaderStyle(formatButtonVisible: false,titleCentered: true),
                locale: 'en_Us',
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusDay,
                selectedDayPredicate: (day)=>isSameDay(day, _focusDay),
                onDaySelected: selectMethod,
              ),
            ),
           
        
          ],
        
        ),
      )
    );
  }

}

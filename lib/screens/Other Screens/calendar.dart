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

  List eventSamples = [
  Event(date: DateTime(2024, 09, 1), title: 'Event 1'),
  Event(date: DateTime(2024, 09, 2), title: 'Event 2'),
  Event(date: DateTime(2024, 09, 3), title: 'Event 3'),
  ];

  void selectMethod(DateTime day, DateTime focusedDay){
    setState(() {
      _focusDay = day;
    });
  }



  Map<DataTable, List<Event>>events = {


  };

  void addevent (){
    eventSamples.add(Event(title: 'random', date: _focusDay));
    for (int i=0; i<eventSamples.length; i++){
       print(eventSamples[i].title +' ${eventSamples[i].date}');
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add,color: Colors.white,),
          backgroundColor: Colors.teal,
          onPressed: (){
        addevent();
      }
      ,
      ),
      
      body:SafeArea(
        child: Column(
          children: [
            const Text("Schedule", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: TableCalendar(
                availableGestures: AvailableGestures.all,
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,

                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle
                  ),
                  todayDecoration: BoxDecoration(
                      color: Colors.teal[300],
                      shape: BoxShape.circle
                  )

                ),



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

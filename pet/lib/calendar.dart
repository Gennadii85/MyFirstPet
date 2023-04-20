import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  // ignore: unused_field
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: TableCalendar(
        firstDay: DateTime.utc(2010, 1, 1),
        lastDay: DateTime.utc(2040, 1, 1),
        focusedDay: DateTime.now(),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        // calendarFormat: CalendarFormat.month,
        calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(
                color: Color.fromARGB(255, 55, 192, 73),
                shape: BoxShape.rectangle),
            todayTextStyle: TextStyle(
                color: Color.fromARGB(255, 228, 19, 19), fontSize: 16.0)),
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        headerStyle: const HeaderStyle(formatButtonVisible: false),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPageView extends StatefulWidget {
  const CalenderPageView({super.key});

  @override
  State<CalenderPageView> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPageView> {
  late final ValueNotifier<DateTime> _focusedDay;
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _focusedDay = ValueNotifier(DateTime.now());
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay.value,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay.value = focusedDay;
          });
        },
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: Colors.blue[200],
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.red[100],
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

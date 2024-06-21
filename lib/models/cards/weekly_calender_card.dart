import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyCalenderCard extends StatefulWidget {
  const WeeklyCalenderCard({super.key});

  @override
  State<WeeklyCalenderCard> createState() => _WeekCalenderCardState();
}

class _WeekCalenderCardState extends State<WeeklyCalenderCard> {
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.lightGreen[200]),
      child: Column(
        children: [
          TableCalendar(
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
            calendarFormat: CalendarFormat.week,
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
          const Divider(
            thickness: 0.5,
            color: Colors.black26,
          ),
          const Center(
            child: Text('메모장'),
          )
        ],
      ),
    );
  }
}

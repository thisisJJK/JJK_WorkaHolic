import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:workaholic/controllers/memo_controller.dart';
import 'package:workaholic/controllers/root_controller.dart';
import 'package:workaholic/controllers/selected_day_controller.dart';
import 'package:workaholic/views/pages/bottom_pages/calender/memo/memo_list_view.dart';

class WeeklyCalenderCard extends StatefulWidget {
  const WeeklyCalenderCard({super.key});

  @override
  State<WeeklyCalenderCard> createState() => _WeekCalenderCardState();
}

class _WeekCalenderCardState extends State<WeeklyCalenderCard> {
  late final ValueNotifier<DateTime> _focusedDay;
  final MemoController _memoController = Get.put(MemoController());
  final SelectedDayController _selectedDayController =
      Get.put(SelectedDayController());
  final RootController rootController = Get.put(RootController());
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
    return Obx(
      () => Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.lightGreen[200]),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _selectedDayController.selectedDay.value,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDayController.selectedDay.value, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                _selectedDayController.updateSelectedDay(selectedDay);
                _memoController
                    .fetchMemos(_selectedDayController.selectedDay.value);
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
            const MemoListView(),
          ],
        ),
      ),
    );
  }
}

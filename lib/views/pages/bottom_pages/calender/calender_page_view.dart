import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:workaholic/controllers/memo_controller.dart';
import 'package:workaholic/controllers/selected_day_controller.dart';
import 'package:workaholic/views/pages/bottom_pages/calender/memo/memo_add_view.dart';
import 'package:workaholic/views/pages/bottom_pages/calender/memo/memo_list_view.dart';

class CalenderPageView extends StatefulWidget {
  const CalenderPageView({super.key});

  @override
  State<CalenderPageView> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPageView> {
  late final ValueNotifier<DateTime> _focusedDay;

  final MemoController _memoController = Get.put(MemoController());
  final SelectedDayController _selectedDayController =
      Get.put(SelectedDayController());

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
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _selectedDayController.selectedDay.value,
                selectedDayPredicate: (day) {
                  return isSameDay(
                      _selectedDayController.selectedDay.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  _selectedDayController.updateSelectedDay(selectedDay);
                  _memoController
                      .fetchMemos(_selectedDayController.selectedDay.value);
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
              const MemoListView()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => MemoAddView(date: _selectedDayController.selectedDay.value),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

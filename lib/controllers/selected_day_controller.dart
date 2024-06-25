import 'package:get/get.dart';

class SelectedDayController extends GetxController {
  var selectedDay = DateTime.now().obs;
  void updateSelectedDay(DateTime uptateDay) {
    selectedDay.value = uptateDay;
    print('${selectedDay.value}');
  }
}

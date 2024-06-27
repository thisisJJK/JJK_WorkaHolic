import 'dart:async';

import 'package:get/get.dart';

class WorkTimerController extends GetxController {
  var _seconds = 0.obs;
  var _minutes = 0.obs;
  var _hours = 0.obs;
  bool _isRunning = false;
  Timer? _timer;

  get seconds => _seconds;
  get minutes => _minutes;
  get hours => _hours;
  bool get isRunning => _isRunning;

  void startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _incrementTime();
    });
  }

  void stopTimer() {
    _isRunning = false;
    _timer?.cancel();
    _seconds.value = 0;
    _minutes.value = 0;
    _hours.value = 0;
  }

  void _incrementTime() {
    _seconds++;
    if (_seconds.value >= 60) {
      _seconds.value = 0;
      _minutes++;
      if (_minutes >= 60) {
        _hours++;
      }
    }
  }
}

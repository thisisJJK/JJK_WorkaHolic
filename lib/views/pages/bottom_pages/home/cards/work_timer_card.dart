import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:workaholic/controllers/work_timer_controller.dart';

class WorkTimerCard extends StatefulWidget {
  const WorkTimerCard({super.key});

  @override
  State<WorkTimerCard> createState() => _WorkTimerState();
}

class _WorkTimerState extends State<WorkTimerCard> {
  final WorkTimerController _workTimerController =
      Get.put(WorkTimerController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.lightBlue[200]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('근무지'),
                  Text(_workTimerController.isRunning ? '근무중' : '휴식중'),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
              Expanded(
                child: Center(
                  child: _timerText(),
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _workTimerController.isRunning
                      ? _workTimerController.stopTimer()
                      : _workTimerController.startTimer();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.lightBlue[200],
                    elevation: 0,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                label: Text(
                  _workTimerController.isRunning ? '퇴근' : '출근',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: const Icon(Icons.query_builder),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _timerText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${_workTimerController.hours}시간 '),
            Text('${_workTimerController.minutes}분 '),
            Text('${_workTimerController.seconds}초 '),
          ],
        ),
        const Text('근무중')
      ],
    );
  }
}

import 'package:flutter/material.dart';

class WorkTimer extends StatefulWidget {
  const WorkTimer({super.key});

  @override
  State<WorkTimer> createState() => _WorkTimerState();
}

class _WorkTimerState extends State<WorkTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.lightBlue[200]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('근무지'),
                  Text('근무/휴식'),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    '0시간 0분 근무중',
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.lightBlue[200],
                    elevation: 0,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                label: const Text(
                  '출근',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: const Icon(Icons.query_builder),
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class AddSpot extends StatelessWidget {
  const AddSpot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: OutlinedButton.icon(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.05),
        ),
        label: const Text('근무지 추가'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

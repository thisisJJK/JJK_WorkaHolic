import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WageFormat extends StatelessWidget {
  final int wage;
  const WageFormat({super.key, required this.wage});

  @override
  Widget build(BuildContext context) {
    final wageFormat = NumberFormat('#,###').format(wage);
    return Text(
      '￦$wageFormat',
      style: const TextStyle(
          fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}

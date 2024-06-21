import 'package:flutter/material.dart';

class SummaryPageView extends StatefulWidget {
  const SummaryPageView({super.key});

  @override
  State<SummaryPageView> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPageView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('통계'),
    );
  }
}

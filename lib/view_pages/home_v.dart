import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('워커홀릭'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // 카드 형태
          children: [
            Text('주간 캘린더'), // 주간캘린더
            Text('근무 현황'), // 근무 현황
            Text('근무지'), // 근무지 -> 슬라이더로
            Text('근무지 추가'), //추가
          ],
        ),
      ),
      bottomNavigationBar: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('홈'),
          Text('달력'),
          Text('통계'),
        ],
      ),
    );
  }
}

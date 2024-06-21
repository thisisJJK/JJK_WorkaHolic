import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/btn/add_spot.dart';
import 'package:workaholic/models/cards/weekly_calender.dart';
import 'package:workaholic/models/cards/work_spots.dart';
import 'package:workaholic/models/cards/work_timer.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                await _auth.signOut();
                Get.offAllNamed('/login');
              },
              icon: const Icon(Icons.logout)),
          title: const Text('워커홀릭'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            // 카드 형태
            children: [
              Expanded(
                child: ListView(
                  children: const [
                    WeeklyCalenderCard(),
                    SizedBox(
                      height: 8,
                    ),
                    WorkTimer(),
                  ],
                ),
              ),

              const SingleChildScrollView(
                physics: PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SpotCard(),
                    SpotCard(),
                    SpotCard(),
                  ],
                ),
              ),

              // 근무지 -> 슬라이더로
              const AddSpot(), //추가
            ],
          ),
        ));
  }
}

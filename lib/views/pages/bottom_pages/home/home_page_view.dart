import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/controllers/memo_controller.dart';
import 'package:workaholic/views/btn/add_spot_btn.dart';
import 'package:workaholic/views/pages/bottom_pages/home/cards/weekly_calender_card.dart';
import 'package:workaholic/views/pages/bottom_pages/home/cards/work_spot_card.dart';
import 'package:workaholic/views/pages/bottom_pages/home/cards/work_timer_card.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageView> {
  final MemoController memoController = Get.put(MemoController());

  @override
  void initState() {
    memoController.fetchMemos(DateTime.now());

    super.initState();
  }

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
                    WorkSpotCard(),
                    WorkSpotCard(),
                    WorkSpotCard(),
                  ],
                ),
              ),

              // 근무지 -> 슬라이더로
              const AddSpotBtn(), //추가
            ],
          ),
        ));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/controllers/memo_controller.dart';
import 'package:workaholic/controllers/spot_card_controller.dart';
import 'package:workaholic/views/btn/add_spot_btn.dart';
import 'package:workaholic/views/btn/manage_spot_btn.dart';
import 'package:workaholic/views/pages/bottom_pages/home/cards/weekly_calender_card.dart';
import 'package:workaholic/views/pages/bottom_pages/home/cards/work_spot_card.view.dart';
import 'package:workaholic/views/pages/bottom_pages/home/cards/work_timer_card.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageView> {
  final MemoController memoController = Get.put(MemoController());
  final SpotCardController spotCardController = Get.put(SpotCardController());

  @override
  void initState() {
    memoController.fetchMemos(DateTime.now());
    spotCardController.fetchSpots();

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
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const WeeklyCalenderCard(),
                  const SizedBox(
                    height: 8,
                  ),
                  const WorkTimerCard(),
                  const SizedBox(
                    height: 8,
                  ),
                  WorkSpotCard(),
                  const SizedBox(
                    height: 8,
                  ),
                  AddSpotBtn(),
                  const ManageSpotBtn(),
                ],
              ),
            ),
          ),
        ));
  }
}

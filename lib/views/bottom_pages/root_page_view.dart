import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/controllers/root_controller.dart';
import 'package:workaholic/views/bottom_pages/calender_page_view.dart';
import 'package:workaholic/views/bottom_pages/home_page_view.dart';
import 'package:workaholic/views/bottom_pages/summary_page_view.dart';

class RootPageView extends GetView<RootController> {
  const RootPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.rootPageIndex.value,
          children: const [
            HomePageView(),
            CalenderPageView(),
            SummaryPageView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.rootPageIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: controller.changeRootPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: '홈',
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                color: Colors.grey,
              ),
              label: '달력',
              activeIcon: Icon(
                Icons.calendar_month,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
                color: Colors.grey,
              ),
              label: '통계',
              activeIcon: Icon(
                Icons.calculate,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

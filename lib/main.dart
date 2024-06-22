import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/controllers/root_controller.dart';
import 'package:workaholic/views/pages/bottom_pages/calender/calender_page_view.dart';
import 'package:workaholic/views/pages/bottom_pages/home/home_page_view.dart';
import 'package:workaholic/views/pages/bottom_pages/root_page_view.dart';
import 'package:workaholic/views/pages/bottom_pages/summary/summary_page_view.dart';
import 'package:workaholic/views/pages/user_pages/login_page_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workaholic/views/pages/user_pages/signup_page_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(RootController());
      }),
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LogInPageView(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignUpPageView(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePageView(),
        ),
        GetPage(
          name: '/calender',
          page: () => const CalenderPageView(),
        ),
        GetPage(
          name: '/summary',
          page: () => const SummaryPageView(),
        ),
        GetPage(
          name: '/root',
          page: () => const RootPageView(),
        ),
      ],
      title: 'WorkaHolic',
      home: const LogInPageView(),
    );
  }
}

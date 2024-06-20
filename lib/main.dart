import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:worker_holic/view_pages/home_v.dart';
import 'package:worker_holic/view_pages/login_v.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:worker_holic/view_pages/signup_v.dart';
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
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/sign up',
          page: () => const SignUpPage(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
      ],
      theme: ThemeData(
        primaryColor: Colors.pink[200],
      ),
      title: 'Worker Holic',
    );
  }
}

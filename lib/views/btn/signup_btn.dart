import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpBtn extends StatelessWidget {
  const SignUpBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Get.toNamed('/signup');
        },
        child: const Text('회원 가입'));
  }
}

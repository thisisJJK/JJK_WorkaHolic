import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageView extends StatelessWidget {
  const SignUpPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('회원 가입'),
              _SignUpFieldWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignUpFieldWidget extends StatefulWidget {
  const _SignUpFieldWidget();

  @override
  State<_SignUpFieldWidget> createState() => _SignUpFieldControllerState();
}

class _SignUpFieldControllerState extends State<_SignUpFieldWidget> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _rePwdController = TextEditingController();
  String? _errorMessage;
  @override
  void dispose() {
    _emailController.dispose();
    _pwdController.dispose();
    _rePwdController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _pwdController.text,
      );
      if (userCredential.user != null) {
        _emailController.clear();
        _pwdController.clear();
        _rePwdController.clear();

        Get.offNamed('/login');
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: '이메일',
              errorText: _errorMessage,
            ),
            validator: (email) {
              if (email!.isNotEmpty && email.contains('@')) {
                return null;
              } else {
                return '이메일 주소를 다시 입력하세요.';
              }
            },
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: _pwdController,
            decoration: InputDecoration(
              labelText: '패스워드',
              errorText: _errorMessage,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: _rePwdController,
            decoration: InputDecoration(
              labelText: '패스워드 확인',
              errorText: _errorMessage,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: _register,
            child: const Text(
              '가입하기',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.offNamed('/login');
            },
            child: const Text(
              '뒤로가기',
            ),
          ),
        ],
      ),
    );
  }
}

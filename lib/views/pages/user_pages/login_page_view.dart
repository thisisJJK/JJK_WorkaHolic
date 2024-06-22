import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/views/btn/signup_btn.dart';

class LogInPageView extends StatefulWidget {
  const LogInPageView({super.key});

  @override
  State<LogInPageView> createState() => _LoginPageState();
}

class _LoginPageState extends State<LogInPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppName(
            name: 'WorkaHolic',
          ), // 앱제목
          const _LogInFieldWidget(), //아이디비번 필드

          //버튼 후 홈페이지 이동
          const SignUpBtn(), //버튼 후 회원가입 페이지 이동
          TextButton(
              onPressed: () {},
              child: const Text('아이디 & 비밀번호 찾기')), // 버튼 후 찾기 페이지 이동
          Row(
            // SNS 로그인 버튼
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.circle)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.circle)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.circle)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.circle)),
            ],
          ),
        ],
      ),
    );
  }
}

class _LogInFieldWidget extends StatefulWidget {
  const _LogInFieldWidget();

  @override
  State<_LogInFieldWidget> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<_LogInFieldWidget> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _pwdController.dispose();

    super.dispose();
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _pwdController.text,
      );
      if (userCredential.user != null) {
        Get.toNamed('/root');
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
          ElevatedButton(
            onPressed: _login,
            child: const Text(
              '로그인',
            ),
          ),
        ],
      ),
    );
  }
}

class AppName extends StatelessWidget {
  final String name;
  const AppName({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

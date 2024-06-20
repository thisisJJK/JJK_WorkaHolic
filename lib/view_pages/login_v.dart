import 'package:flutter/material.dart';
import 'package:worker_holic/controllers/login_c.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppName(
            name: 'Worker Holic',
          ), // 앱제목
          const LogInFieldController(), //아이디비번 필드
          //LoginBtn(),
          //버튼 후 홈페이지 이동
          //SignupBtn(), //버튼 후 회원가입 페이지 이동
          const Text('아이디 & 비밀번호 찾기'), // 버튼 후 찾기 페이지 이동
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

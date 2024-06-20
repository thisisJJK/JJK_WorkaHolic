import 'package:flutter/material.dart';

class LogInFieldController extends StatefulWidget {
  const LogInFieldController({super.key});

  @override
  State<LogInFieldController> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LogInFieldController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: '이메일',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: _pwdController,
            decoration: const InputDecoration(
              labelText: '패스워드',
            ),
          ),
        ],
      ),
    );
  }
}

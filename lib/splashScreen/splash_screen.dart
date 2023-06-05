import 'dart:async';
import 'package:flutter/material.dart';
import 'package:polo_s/assistants/assistant_methods.dart';
import 'package:polo_s/global/global.dart';
import 'package:polo_s/screens/login_screen.dart';
import 'package:polo_s/screens/main_screen.dart';
import 'package:polo_s/screens/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      if (await firebaseAuth.currentUser != null) {
        firebaseAuth.currentUser != null
            ? AssistantMethods.readCurrentOnlineUserInfo()
            : null;
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => RegisterScreen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Polo-S',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

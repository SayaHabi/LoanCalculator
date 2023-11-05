import 'package:flutter/material.dart';
import 'dart:async';

import 'package:loanapplication/main.dart';

void main() => runApp(MaterialApp(
      home: SplashScreen(),
    ));

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoanCalculatorApp()),
      );
    });

    return Scaffold(
      body: Center(
        child: (Image.asset('assets/splash.png')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:translation_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home_screen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: h * 0.4,
          ),
          Container(
              height: 80,
              width: 80,
              child: Image.asset(
                'assets/icons/icon_1_translate.png',
                fit: BoxFit.contain,
              )),
          Container(
            height: h * 0.02,
          ),
          Text(
            "Let's Translate",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

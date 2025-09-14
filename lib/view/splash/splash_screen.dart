import 'package:flutter/material.dart';
import 'package:syncc/view/splash/splash_background.dart';
import 'package:syncc/view/splash/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.widthOf(context),
        height: MediaQuery.heightOf(context),
        child: Stack(
          children: [
            SplashBackground(),
            Container(color: Colors.black.withValues(alpha: 0.4)),

            SplashBody(),
          ],
        ),
      ),
    );
  }
}

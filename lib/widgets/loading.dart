// ignore_for_file: prefer_const_constructors, unused_import, depend_on_referenced_packages
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sindhu/current.dart';
import 'package:sindhu/tools/colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: CurrentPage(),
      duration: 3500,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network('https://lottie.host/73b75ae3-3d72-488a-a20a-8153977ce195/6mHzQfU1Ph.json',width: 50, height: 50),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'SINDHU',
                speed: Duration(milliseconds: 500),
                textStyle: GoogleFonts.montserrat(color: cyan)
              )
            ],
            totalRepeatCount: 1,
          )
        ],
      ),
      backgroundColor: Colors.black,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
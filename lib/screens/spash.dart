import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

import 'package:meow_finder/screens/cats.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      childWidget: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lotties/splash.json',
              frameRate: const FrameRate(60 * 0.64),
              repeat: false,
            ),
            const SizedBox(height: 20.0),
            const Text(
              '🐾 Catbreed 🐾',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
            ),
          ],
        ),
      ),
      nextScreen: CatsScreen(),
      asyncNavigationCallback: () async {
        print('Send Logs');
        await Future.delayed(const Duration(milliseconds: 4000));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SucssesfulScreen extends StatefulWidget {
  const SucssesfulScreen({super.key});

  @override
  State<SucssesfulScreen> createState() => _SucssesfulScreenState();
}

class _SucssesfulScreenState extends State<SucssesfulScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animation/congrats.json',
            ),
            const Text(
              'Congratulations!\n Your order is complete!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF07A66FF),
                  fontSize: 32,
                  fontFamily: 'Lobster',
                  fontWeight: FontWeight.bold),
            ),
            
          ],
        ),
      ),
    );
  }
}

// void delayedNavigate(context, path) {
//   Future.delayed(
//     const Duration(seconds: 3),
//     () {
//       customReplacementNavigate(context, path);
//     },
//   );
// }

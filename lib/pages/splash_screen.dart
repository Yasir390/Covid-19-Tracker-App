import 'dart:async';
import 'dart:math';

import 'package:covid19_tracker/pages/world_states.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      vsync: this, duration: const Duration(seconds: 3))..repeat();

 @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const WorldStatesScreen(),));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: const SizedBox(
                height: 200,
                width: 200,
                child: Center(
                  child: Image(image: AssetImage('images/virus.jpg')),
                ),
              ),
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value *2*pi,
                  child:child
                );
              },
            ),
            const SizedBox(height: 40,),
            const Align(
              alignment: Alignment.center,
              child: Text('Covid-19\n Tracker App',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                ),
                textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}

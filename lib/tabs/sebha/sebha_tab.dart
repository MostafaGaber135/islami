import 'package:flutter/material.dart';
import 'dart:math';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double rotationAngle = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 60,
          ),
          height: 380,
          child: Stack(
            children: [
              Positioned(
                right: 130,
                left: 149,
                child: Image.asset(
                  'assets/images/head_sebha_logo.png',
                ),
              ),
              Positioned(
                top: 92,
                left: 44.82,
                child: GestureDetector(
                  onTap: incrementCounter,
                  child: AnimatedRotation(
                    turns: rotationAngle / (2 * pi),
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    child: Image.asset('assets/images/body_sebha_logo.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          'عدد التسبيحات',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 81,
          width: 69,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0XFFB7935F),
          ),
          child: Center(
            child: Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 51,
          width: 137,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0XFFB7935F),
          ),
          child: Center(
            child: Text(
              'سبحان الله',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  void incrementCounter() {
    setState(() {
      counter++;
      rotationAngle += pi / 6;
    });
  }
}

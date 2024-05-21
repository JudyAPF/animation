import 'dart:math';

import 'package:flutter/material.dart';

class AnimContainerScreen extends StatefulWidget {
  const AnimContainerScreen({super.key});

  @override
  State<AnimContainerScreen> createState() => _AnimContainerScreenState();
}

class _AnimContainerScreenState extends State<AnimContainerScreen> {

  double width = 100;
  double height = 100;
  Color color = Colors.red;
  double radius = 20;
  int duration = 1000;
  void change() {
    setState(() {
      final random = Random();
      width = random.nextInt(300).toDouble();
      height = random.nextInt(300).toDouble();
      radius = random.nextInt(30).toDouble();
      duration = random.nextInt(2000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animated Container'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: change,
                child: const Text('Animate'),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(27, 25, 146, 0.911),
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: const Center(child: Text('Container', style: TextStyle(
                  color: Colors.white
                ),)),
              ),
            ],
          ),
        )));
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';

// THIS IS THE BLUR EFFECT CODE
class BlurEffect extends StatelessWidget {
  const BlurEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: 60,
          sigmaY: 60,
        ),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color.fromARGB(157, 235, 236, 255),
            borderRadius: BorderRadius.circular(2000),
            border: Border.all(width: 0),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(236, 237, 255, 0.637),
                spreadRadius: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// THE DOT DECORATION
class CustomProgressIndicator extends StatelessWidget {
  final int currentIndex;

  const CustomProgressIndicator(this.currentIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dot(
          expanded: currentIndex == 0,
        ),
        const SizedBox(width: 5),
        Dot(
          expanded: currentIndex == 1,
        ),
        const SizedBox(width: 5),
        Dot(
          expanded: currentIndex == 2,
        ),
      ],
    );
  }
}

//THE DOT STYLING
class Dot extends StatelessWidget {
  final bool expanded;

  const Dot({super.key, required this.expanded});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: expanded
          ? 24
          : 8, // Adjust the expanded and collapsed sizes as needed
      height: 8,
      decoration: BoxDecoration(
        color: expanded ? Colors.white : const Color(0XFF606465),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Center(
        child: Opacity(
          opacity: expanded ? 0 : 1,
          child: Container(
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

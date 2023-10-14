import 'package:cyclecare/onboarding/decorations.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;

  const OnboardingScreen({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                const BlurEffect(),
                Center(
                  child: Image.asset(
                    imageAsset,
                    scale: 2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'BakBak One',
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Ropa Sans',
                          letterSpacing: 0.5,
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

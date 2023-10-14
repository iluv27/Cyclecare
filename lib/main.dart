import 'package:flutter/material.dart';
import 'theme.dart';
import 'onboarding/main_screens.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreenOne(),
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.from(
          colorScheme:
              const ColorScheme.dark(background: AppColors.backgroundColor)),
    );
  }
}


// keytool -list -v -keystore "C:\Users\ehied\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
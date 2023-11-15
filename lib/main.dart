import 'package:flutter/material.dart';
import 'theme.dart';
import 'onboarding/main_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'ui/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  initializeDateFormatting().then((_) => runApp(const MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.from(
          colorScheme:
              const ColorScheme.dark(background: AppColors.backgroundColor)),
    );
  }
}


// keytool -list -v -keystore "C:\Users\ehied\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
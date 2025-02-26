import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sinhgad_fees_application/firebase_options.dart';
import 'package:sinhgad_fees_application/pages/Home.dart';
import 'package:sinhgad_fees_application/pages/student_login.dart';
import 'package:sinhgad_fees_application/pages/faculty_login.dart';
import 'package:sinhgad_fees_application/pages/onboarding.dart';
import 'package:sinhgad_fees_application/splash_screen.dart';
import 'package:sinhgad_fees_application/pages/Student/student_home.dart';
import 'package:sinhgad_fees_application/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => Home(),
        '/student_login': (context) => StudentLoginPage(),
        '/faculty_login': (context) => FacultyLoginPage(),
        '/onboarding': (context) => RegistrationPage(),
        '/student_home': (context) => StudentHome(),
        '/wrapper': (context) => Wrapper(),
      },
    );
  }
}
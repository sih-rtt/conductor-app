import 'package:conductor_app/Presentation/Dashboard/dashboard.dart';
import 'package:conductor_app/Presentation/Login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor:
              const Color(0xFF8338EC), //acts as primary colour in our case
          primary: const Color(
              0xFF8338EC), //acts as accent colour this colour is for elements which need to draw attention
          secondary: const Color(0xFF585BE2),
          background: const Color(0xFFFFFFFF),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0B0C04),
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0B0C04),
          ),
          headlineLarge: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0B0C04),
          ),
          bodySmall: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 15,
            color: Color(0xFF0B0C04),
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 17,
            color: Color(0xFF0B0C04),
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 19,
            color: Color(0xFF0B0C04),
          ),
          labelSmall: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0B0C04),
          ),
          labelMedium: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0B0C04),
          ),
          labelLarge: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 27,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0B0C04),
          ),
          titleLarge: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0B0C04),
          ),
          titleMedium: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0B0C04),
          ),
          titleSmall: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0B0C04),
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => const Dashboard(),
      },
    );
  }
}

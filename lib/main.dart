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
              const Color(0xFFFFBE0B), //acts as primary colour in our case
          primary: const Color(
              0xFF8338EC), //acts as accent colour this colour is for elements which need to draw attention
          secondary: const Color(0xFFFFBE0B),
          background: const Color(0xFF1E1E1E),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        }),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          bodySmall: TextStyle(
              fontFamily: 'Urbanist', fontSize: 15, color: Colors.white),
          bodyMedium: TextStyle(
              fontFamily: 'Urbanist', fontSize: 17, color: Colors.white),
          bodyLarge: TextStyle(
              fontFamily: 'Urbanist', fontSize: 19, color: Colors.white),
          labelSmall: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 23,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 27,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFBE0B)),
          titleLarge: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 23,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 21,
            fontWeight: FontWeight.w500,
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

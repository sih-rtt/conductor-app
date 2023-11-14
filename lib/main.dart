import 'package:conductor_app/Presentation/HomeScreen/home_screen.dart';
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
          bodySmall: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 20,
            color: Color(0xFF0B0C04),
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 24,
            color: Color(0xFF0B0C04),
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shortquiz/auth/forgotpasswordscreen.dart';
import 'package:shortquiz/auth/loginscreen.dart';
import 'package:shortquiz/auth/signupscreen.dart';
import 'package:shortquiz/screens/homescreen.dart';
import 'package:shortquiz/screens/splashscreen.dart';

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
      routes: {
        '/quickquizhome': (context) => const HomeScreen(),
        '/login' : (context)=> const LoginScreen(),
        '/signup' : (context) => const SignupScreen(),
        '/forgotpassword' : (context) => const  ForgotPasswordScreen()
      },
      title: 'Quick Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

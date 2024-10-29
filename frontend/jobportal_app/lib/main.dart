import 'package:flutter/material.dart';
import 'package:jobportal_app/features/auth/pages/login.dart';
import 'package:jobportal_app/features/auth/pages/sign_up.dart';
import 'package:jobportal_app/features/dashboard/pages/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Portal App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

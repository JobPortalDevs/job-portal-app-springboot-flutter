import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobportal_app/features/pages/dashboard.dart';

void main() {
  runApp(const
   ProviderScope(
      child: MyApp()
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Portal',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: UserProfileScreen(), // Start with the UserProfileScreen
      // home: const LoginPage(), // Start with the UserProfileScreen
      // home: const SignUpPage(), // Start with the UserProfileScreen
      home:  const HomePage(), // Start with the UserProfileScreen
    );
  }
}


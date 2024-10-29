import 'package:flutter/material.dart';
import 'package:jobportal_app/features/job/pages/job_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Job Portal',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: JobScreen());
  }
}

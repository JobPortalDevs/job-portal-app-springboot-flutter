import 'package:flutter/material.dart';

class AppComponents extends StatefulWidget {
  const AppComponents({super.key});

  @override
  State<AppComponents> createState() => _AppComponentsState();
}

class _AppComponentsState extends State<AppComponents> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

import 'package:flutter/material.dart';

class EngineerScreen extends StatefulWidget {
  const EngineerScreen({super.key});

  @override
  State<EngineerScreen> createState() => _EngineerScreenState();
}

class _EngineerScreenState extends State<EngineerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text('EngineerScreen'),
        ),
    );
  }
}
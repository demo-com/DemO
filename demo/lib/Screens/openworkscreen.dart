
import 'package:flutter/material.dart';

class OpenWorkScreen extends StatefulWidget {
  const OpenWorkScreen({super.key});

  @override
  State<OpenWorkScreen> createState() => _OpenWorkScreenState();
}

class _OpenWorkScreenState extends State<OpenWorkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: const Text('OpenWork'),
      ),
    );
  }
}
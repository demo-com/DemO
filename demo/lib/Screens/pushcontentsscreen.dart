import 'package:flutter/material.dart';


class PushConScreen extends StatefulWidget {
  const PushConScreen({super.key});

  @override
  State<PushConScreen> createState() => _PushConScreenState();
}

class _PushConScreenState extends State<PushConScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(alignment: Alignment.center,
      child: const Text('PushContent Screen'),
     ),
    );
  }
}
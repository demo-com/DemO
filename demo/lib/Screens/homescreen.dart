
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body:_buildBody,
      // bottomNavigationBar: _buildBottomNavigationBar,
    );
  }
  get _buildAppBar{
    return AppBar(
      title:const Text("HomeScreen"),
    );
  }
  get _buildBody{
    return Container(
      alignment:Alignment.center,
      width: double.infinity,
      height:double.infinity,
      color: Colors.grey,
      child:const Text("BodyScreen"),
    );
  }
  
}
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'engineeringscreen.dart';
import 'homescreen.dart';
import 'jobsscreen.dart';
import 'notification.dart';
import 'pushcontentsscreen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var _page = 0;
  final _pages = const [
    HomeScreen(),
    EngineerScreen(),
    PushConScreen(),
    JobScreen(),
    NotificationScreen()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_pages[_page],
      bottomNavigationBar: _buildBottomNavigationBar,
    );
  }

   get  _buildBottomNavigationBar{
    return CurvedNavigationBar(
      index: 0, //initail index
      color:const Color.fromRGBO(0, 151, 255,1.0),
      backgroundColor:const Color.fromARGB(110, 255, 255, 255),
      animationCurve:Curves.easeInOut,
      animationDuration:const Duration(milliseconds: 500),
      onTap: (index){
        _page = index;
        setState(() {
          _page = index;
        });
      },
      items:const [
        ImageIcon(
          AssetImage('assets/home.png'),
          color: Colors.black,
          size: 35.0,
          semanticLabel:'Home',
        ),
        ImageIcon(
          AssetImage('assets/engineer.png'),
          color: Colors.black,
          size: 35.0,
          semanticLabel:'Engineer',
        ),
        ImageIcon(
          AssetImage('assets/push.png'),
          color: Colors.black,
          size: 35.0,
          semanticLabel:'Push-Contents',
        ),
        ImageIcon(
          AssetImage('assets/job.png'),
          color: Colors.black,
          size: 35.0,
          semanticLabel:'Jobs',
        ),
        ImageIcon(
          AssetImage('assets/notification.png'),
          color: Colors.black,
          size: 35.0,
          semanticLabel:'Notifications',
        ),
      ]
    );
  }
}
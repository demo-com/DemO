

import 'package:demo/Screens/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'designcolors.dart';

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({super.key});

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {

  String uerName = 'Visal Nann';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(left:25.0,top:10.0,bottom: 5.0),
      width: double.infinity,
      height:170.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops:const [0.3,1.0],
          colors: [
            hexStringToColor("#36d1dc"),
            hexStringToColor("#5b86e5"),
          ]
        )
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
             foregroundColor: Colors.white70,
              radius:50.0,
              backgroundImage: AssetImage("assets/profile_user.jpg"),
          ),
          const SizedBox(height: 5.0,),
          Text(
            uerName,
            style:const  TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(left: 5.0),
            height: 30.0,
            child: TextButton(
            onPressed:(){
              Navigator.push(
                context,
                PageTransition(
                    curve: Curves.linear,
                    type: PageTransitionType.topToBottom,
                    duration: const Duration(milliseconds: 2000),
                    child: const ProfilePage(),
                ),
              );
            },
            child:const Text(
              "View your profile ",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 13.0,
                fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
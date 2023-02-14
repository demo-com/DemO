

import 'package:demo/Screens/openworkscreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyDrawerList extends StatelessWidget {
  const MyDrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width:double.infinity,
      height:430.0,
      child: ListView(
         padding: const EdgeInsets.all(0.8),
         children:[
           ListTile(
             leading:const SizedBox(
               width:35.0,
               height: 35.0,
               child: Image(
                 image: AssetImage('assets/openWork.png'),
                 fit: BoxFit.cover,
                ),
             ),
             title: const Text('Open Work',style: TextStyle(fontSize: 15.0,),),
             onTap:()=>{
               Navigator.push(
                  context,
                  PageTransition(
                    curve: Curves.linear,
                    type: PageTransitionType.rightToLeft,
                    duration: const Duration(milliseconds: 500),
                    child: const OpenWorkScreen(),
                ),
              )
             }
           ),
           const Divider(),
           ListTile(
             leading:const SizedBox(
               width:35.0,
               height: 35.0,
               child: Image(
                 image: AssetImage('assets/nightMode.png'),
                 fit: BoxFit.cover,
                ),
             ),
             title: const Text('Nightmode',style: TextStyle(fontSize: 15.0,),),
             onTap:()=>{}
           ),
           const Divider(),
           ListTile(
             leading:const SizedBox(
               width:35.0,
               height: 35.0,
               child: Image(
                 image: AssetImage('assets/notificationOff.png'),
                 fit: BoxFit.cover,
                ),
             ),
             title: const Text('Turn off navigation',style: TextStyle(fontSize: 15.0,),),
             onTap:()=>{}
           ),
           const Divider(),
           ListTile(
             leading:const SizedBox(
               width:35.0,
               height: 35.0,
               child: Image(
                 image: AssetImage('assets/setting.png'),
                 fit: BoxFit.cover,
                ),
             ),
             title: const Text('Setting',style: TextStyle(fontSize: 15.0,),),
             onTap:()=>{}
           ),
           const Divider(),
           ListTile(
             leading:const SizedBox(
               width:35.0,
               height: 35.0,
               child: Image(
                 image: AssetImage('assets/signOut.png'),
                 fit: BoxFit.cover,
                ),
             ),
             title: const Text('Sign out',style: TextStyle(fontSize: 15.0,),),
             onTap:()=>{}
           ),
           const Divider(),
         ],
      ),
    );
  }
}
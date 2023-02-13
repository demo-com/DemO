

import 'package:flutter/material.dart';

class MyDrawerList extends StatelessWidget {
  const MyDrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width:double.infinity,
      height: 400.0,
      child: ListView(
         padding: const EdgeInsets.all(8.0),
         children:[
           ListTile(
             leading:Container(
               width:50.0,
               height: 50.0,
               color: const Color.fromARGB(65, 0, 0, 0),
               child: const Image(
                 image: AssetImage('assets/openWork.png'),
                 fit: BoxFit.cover,
                ),
             ),
             title: const Text('Open Work',style: TextStyle(fontSize: 15.0,),),
             onTap:()=>{}
           ),
           const Divider(),
           ListTile(
             leading: const ImageIcon(
               AssetImage('assets/notificationOff.png'),
               size: 25.0,
             ),
             title: const Text('Notification Off',style: TextStyle(fontSize: 15.0,),),
             onTap:()=>{}
           ),
           const Divider(),
           ListTile(
             leading: const ImageIcon(
               AssetImage('assets/nightMode.png'),
               size: 25.0,
             ),
             title: const Text('Night Mode',style: TextStyle(fontSize: 15.0,),),
             onTap:()=>{}
           ),
           const Divider(),
           ListTile(
             leading: const ImageIcon(
               AssetImage('assets/setting.png'),
               size: 25.0,
             ),
             title: const Text('Setting',style: TextStyle(fontSize: 15.0,),),
             onTap:()=>{}
           ),
           const Divider(),
           ListTile(
             leading: const ImageIcon(
               AssetImage('assets/signOut.png'),
               size: 25.0,
             ),
             title: const Text('Sign Out',style: TextStyle(fontSize: 15.0,),),
             onTap:()=>{}
           ),
           const Divider(),
         ],
      ),
    );
  }
}
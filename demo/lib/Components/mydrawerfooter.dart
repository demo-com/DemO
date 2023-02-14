
import 'package:flutter/material.dart';

class MyDrawerFooter extends StatefulWidget {
  const MyDrawerFooter({super.key});

  @override
  State<MyDrawerFooter> createState() => _MyDrawerFooterState();
}

class _MyDrawerFooterState extends State<MyDrawerFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomLeft,
        width:double.infinity,
        height: 200.0,
        child: ListView(
        padding: const EdgeInsets.all(0.8),
        children: [
          ListTile(
             leading:const SizedBox(
               width:35.0,
               height: 35.0,
               child: Image(
                 image: AssetImage('assets/upToPro.png'),
                 fit: BoxFit.cover,
                ),
             ),
             title: const Text('Up to professional mode',style: TextStyle(fontSize: 15.0,),),
             onTap:()=>{}
           ),
           const Divider(),
           ListTile(
             leading:const SizedBox(
               width:35.0,
               height: 35.0,
               child: Image(
                 image: AssetImage('assets/shareApp.png'),
                 fit: BoxFit.cover,
                ),
             ),
             title: const Text('Invite freinds',style: TextStyle(fontSize: 15.0,),),
             onTap:()=>{}
           ),
        ],
      )
    );
  }

 
}
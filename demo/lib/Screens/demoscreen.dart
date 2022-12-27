
import 'package:flutter/material.dart';
import '../Components/designclipper.dart';
import '../Components/designcolors.dart';
import 'signinscreen.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:_buildBody,
    );
  }

  get _buildBody=>InkWell(
    onTap:(){
      Navigator.push(
        context,
        MaterialPageRoute(builder:(context)=>const SignInScreen())
      );
    },
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end:   Alignment.bottomLeft,
          colors: [
            hexStringToColor("#36d1dc"),
            hexStringToColor("#5b86e5"),
          ]
        ),
      ),
      child:ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              alignment: Alignment.topCenter,
              width:double.infinity,
              height: double.infinity,
              color:Colors.white,
              child: Column(
                children: [
                  ClipPath(
                        clipper: TopWaveClipper(),
                        child: Container(
                          width:double.infinity,
                          height:200.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                            end:   Alignment.bottomLeft,
                            colors: [
                              hexStringToColor("#36d1dc"),
                              hexStringToColor("#5b86e5"),
                          ]
                        ),
                      ),
                    ),
                  ),
                  Image.asset("assets/main_logo.jpg"),  
                ]
              ),
        )
      ),
    ),
  );
}
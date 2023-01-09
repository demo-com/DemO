
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import '../Components/designclipper.dart';
import '../Components/designcolors.dart';
import '../Components/signinsignupcomp.dart';
import 'registerscreen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController    = TextEditingController();
  
  Future signUp(String email,String password)async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:(context)=>const RegisterScreen()
          )
        );
      });
    }on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        _showTopFlath(const Text("your password not weak . . .!"));
      }else if(e.code == 'email-already-in-use'){
        _showTopFlath(const Text("Email already use  . . .!"));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody,
    );
  }
  //build flash handle when user signin
  void _showTopFlath(Text erroText,{FlashBehavior style = FlashBehavior.fixed}){
    showFlash(
      context: context,
      duration:const Duration( seconds:5),
      persistent: true,
      builder: ((context, controller) {
        return Flash(
          controller: controller,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          behavior: style,
          position: FlashPosition.top,
          child:FlashBar(
            content:erroText,
            primaryAction: TextButton(
              onPressed: () {},
              child: const Text(
                'Try again . . .!',
                style: TextStyle(
                color: Colors.black,
              )
            ),
           ),
          )
        );
      })
    );
  }
  get _buildBody=>Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipPath(
                      clipper: TopWaveClipper(),
                      child: Container(
                        width:double.infinity,
                        height:150.0,
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
                Container(
                  margin:const EdgeInsets.only(top: 8.0),
                  width: 280.0,
                  height:380.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.0),
                    boxShadow:const [
                      BoxShadow(
                        color:Colors.grey,
                        blurStyle: BlurStyle.normal,
                        offset: Offset(0.0,0.0),
                        spreadRadius: 4.0,
                        blurRadius: 10.0,
                      ),
                    ],
                    gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end:   Alignment.bottomLeft,
                          colors: [
                            hexStringToColor("#36d1dc"),
                            hexStringToColor("#5b86e5"),
                        ]
                      ),
                  ),
                  child: Column(
                    children: 
                      [Padding(
                        padding:const  EdgeInsets.fromLTRB(10.0,5.0,10.0, 10.0),
                        child: Column(
                          children: [
                            signInUpText("Sign Up New Account",15.0,FontWeight.bold),
                            const SizedBox(height: 15.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  signInUpText("User Name",15.0,FontWeight.bold),
                                  reusableTextField(
                                    "user name . . .",
                                    Icons.person,
                                    false,
                                    usernameController,
                                  )
                              ],
                            ),
                            const SizedBox(height: 5.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  signInUpText("Email",15.0,FontWeight.bold),
                                  reusableTextField(
                                    "enter your email . . .",
                                    Icons.email,
                                    false,
                                    emailController,
                                  )
                              ],
                            ),
                            const SizedBox(height: 5.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  signInUpText("Password",15.0,FontWeight.bold),
                                  reusableTextField(
                                    "enter your password . . .",
                                    Icons.lock,
                                    true,
                                    passwordController,
                                  )
                              ],
                            ),
                            const SizedBox(height: 5.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  signInUpText("Confirm-Password",15.0,FontWeight.bold),
                                  reusableTextField(
                                    "enter your password . . .",
                                    Icons.lock,
                                    true,
                                    passwordController,
                                  )
                              ],
                            ),
                            const SizedBox(height:15.0,),
                            signInUpButton(
                              context, 
                              false,
                              ()async{
                               await signUp(
                                 emailController.text,
                                 passwordController.text,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]
          ),
      )
    ),
  );

}
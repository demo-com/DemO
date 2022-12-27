
import 'package:demo/Screens/homescreen.dart';
import 'package:demo/Screens/signupscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Components/designclipper.dart';
import '../Components/designcolors.dart';
import '../Components/signinsignupcomp.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController    = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  
  Future signIn(String email , String password)async{
    try{
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password
      ).then((value) =>{
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:(context)=>const HomeScreen()
        ))
      });
    }on FirebaseAuthException  catch(e){
      if(e.code == 'user-not-found'){
       
      }else if(e.code == 'wrong-password'){
        
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
                            signInUpText("Sign In Your Account",15.0,FontWeight.bold),
                            const SizedBox(height: 15.0,),
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
                            const SizedBox(height: 10.0,),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                textButton("view?", (){}),
                                const SizedBox(width: 25.0,),
                                textButton("for got your passwrod?", (){})
                              ],
                            ),
                            const SizedBox(height:5.0,),
                            signInUpButton(
                              context, 
                              true,
                              ()async{
                                await signIn(
                                  emailController.text,
                                  passwordController.text
                                );
                              }
                            ),
                            const SizedBox(height:10.0,),
                            Container(
                              alignment: Alignment.center,
                              width:260.0,
                              height:50.0,                             
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width:150.0,
                                    height:40.0,
                                    child:signInUpText("sign in width other way?",13.0,FontWeight.normal),
                                  ),
                                  const SizedBox(width:5.0,),
                                  Container(
                                    alignment: Alignment.center,
                                    width:47.0,
                                    height:47.0,                                   
                                    child:InkWell(
                                        onTap: (() {
                                          
                                        }),
                                        child:Image.asset("assets/facebook_icon.png",fit:BoxFit.cover),
                                      ),
                                    ),
                                  const SizedBox(width:5.0,),
                                  Container(
                                    alignment: Alignment.center,
                                    width:40.0,
                                    height:40.0,                              
                                    child:InkWell(
                                      onTap: (() {
                                        
                                      }),
                                      child:Image.asset("assets/google_icon.png",fit:BoxFit.cover),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            textButton(
                              "create new account?",
                               (){
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context)=>const SignUpScreen()
                                    )
                                  );
                               },
                            ),
                             const SizedBox(height: 20.0,),
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

import 'package:demo/Screens/demoscreen.dart';
import 'package:demo/Screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:((context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return _isLoading();
          }
          if(snapshot.hasError){
            return _error(context);
          }
          if(snapshot.hasData){
            return const HomeScreen();
          }
         else{
           return const DemoScreen();
         }
        })
       ),
    );
  }
  Widget _isLoading(){
    return const Center(child: CircularProgressIndicator());
  }
  Widget _error(BuildContext context) {
    return Center(
      child: Text(
        "Something went wrong...!",
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
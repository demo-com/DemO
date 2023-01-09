

import 'package:demo/Components/designcomponentregister.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody,
    );
  }
  get _buildBody{
    return Container(
      alignment:Alignment.topCenter,
      child:Column(
          children: [
            appLogo("assets/app_icon.png",context),
            Container(
                margin:const EdgeInsets.all(10.0),
                padding:const EdgeInsets.fromLTRB(15.0, 20.0, 15.0,20.0),
                width:(MediaQuery.of(context).size.width),
                height: ( MediaQuery.of(context).size.height),
              ),
          ],
        )
    );
  }
}

import 'package:flutter/material.dart';

//text fiel in sign in or sign up screen
TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
      return TextField(
        controller: controller,
        obscureText: isPasswordType,
        enableSuggestions: !isPasswordType,
        autocorrect: !isPasswordType,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black.withOpacity(0.7)),
        decoration: InputDecoration( 
          contentPadding:const EdgeInsets.all(0.8),
          prefixIcon:Icon(
            icon,
            size: 30.0,
            color: Colors.black,
          ),
         labelText: text,
         labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
         filled: true,
         fillColor: Colors.white.withOpacity(0.2),
         floatingLabelBehavior: FloatingLabelBehavior.never,
         border: OutlineInputBorder(
          gapPadding:0.1,
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        ),
        keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
      );
   }

//button sign in or sign up screen
Container signInUpButton(BuildContext context,bool isLoading, Function onTap) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color.fromARGB(35, 0, 0, 0);
            }
            return const Color.fromARGB(137, 247, 248, 249);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)))),
          child: Text(
            isLoading?'Sign In':'Sign Up',
            style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
          ),
      ),
    );
  }

//text in sign in or sign up screen
Text signInUpText(String text,double fSize,FontWeight fontWeight){
  return Text(
    text,
    style:TextStyle(
      color: Colors.black,
      fontSize:fSize,
      fontWeight: fontWeight,
    ),
  );
}

// textbutton in sign in or sign up screen
TextButton textButton(String text,Function onPressed){
  return TextButton(
    style:TextButton.styleFrom(
      padding:const  EdgeInsets.symmetric(horizontal:0.5),
      foregroundColor: Colors.black,
      textStyle: const TextStyle(fontSize: 13.0)
    ),
    onPressed:(){
      onPressed();
    },
   child:Text(text),
  );
}

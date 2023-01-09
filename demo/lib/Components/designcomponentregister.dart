

import 'package:flutter/material.dart';
Container appLogo(String assetImg,BuildContext context){
  return Container(
    height:(MediaQuery.of(context).size.height)/2.5,
    width:MediaQuery.of(context).size.width,
    child:Image(image: AssetImage(assetImg),fit:BoxFit.cover)
 );
}
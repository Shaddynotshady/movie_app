import 'package:flutter/material.dart';

class SizedBoxPadding{
  static topPadding(BuildContext context){
    return SizedBox(
      height: MediaQuery.of(context).padding.top+20,
    );
  }

  static sizedBoxHeight({double height=10}){
    return  SizedBox(
      height: height,
    );
  }

  static sizedBoxWidth({double width=10}){
    return SizedBox(
      width: width,
    );
  }
}
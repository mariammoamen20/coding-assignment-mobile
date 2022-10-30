import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   String text ;
   double fontSize ;
   String fontFamily;
   FontWeight? fontWeight;
   CustomText({required this.text,this.fontSize = 16 , this.fontFamily = 'Pop',this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight
      ),
    );
  }
}

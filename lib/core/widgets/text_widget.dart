import 'package:flutter/material.dart';

class TextItems{
  static  items({required String text,required double size,}){
    return Text(text,style: TextStyle(fontSize: size),);
  }
}
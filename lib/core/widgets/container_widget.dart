import 'package:flutter/material.dart';

class ContainerItems{
  static  Container items({required double size,}){
    return Container(
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/png_image/image.jpg'),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Helper{

  static const NEED_REFRESH = true;

  static showSnackBar(BuildContext context, String message, {Color color = Colors.black}){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
        )
    );
  }

}
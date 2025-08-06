import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {

  final Widget child;
  final EdgeInsets? padding;
  const CustomBackground({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end:  Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.white,
            ]
        )
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String title;
  final Color color;
  final VoidCallback onPressed;
  final double radius;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color = Colors.blue,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          onPressed: onPressed,
          child: Text(title, style: TextStyle(color: Colors.white))
      ),
    );
  }
}

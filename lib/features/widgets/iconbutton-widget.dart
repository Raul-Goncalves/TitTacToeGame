import 'package:flutter/material.dart';

class iconbutton_Widget extends StatelessWidget {
  const iconbutton_Widget({super.key, required this.icon, this.onPressed});

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icon),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0D0599).withOpacity(0.6),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Cantos arredondados
        ),
        elevation: 1,
      ),
    );
  }
}

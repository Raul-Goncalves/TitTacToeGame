import 'package:flutter/material.dart';

import '../../core/fonts/app-fonts.dart';

class button_Widget extends StatelessWidget {
  const button_Widget({super.key, required this.text, this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 331,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0D0599).withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          shadowColor: Colors.black,
          minimumSize: Size(331, 52),
          overlayColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Text('$text', style: appFonts.Title.copyWith(color: Colors.white)),
      ),
    );
  }
}

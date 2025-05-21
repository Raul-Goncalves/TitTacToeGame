import 'package:flutter/material.dart';

class SelectedPlayerOption extends StatelessWidget {
  final String player;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectedPlayerOption({
    Key? key,
    required this.player,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Color(0xFF111043).withOpacity(0.3),
        highlightColor: Color(0xFF111043).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 143,
          width: 143,
          decoration: ShapeDecoration(
            color: isSelected ? Color(0xFF111043).withOpacity(0.3) : const Color(0xC6E2E2E2),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: isSelected ? Color(0xFF111043) : Colors.white,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 14,
                offset: Offset(4, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/images/interface/chose/${player.toLowerCase()}.png',
            ),
          ),
        ),
      ),
    );
  }
}

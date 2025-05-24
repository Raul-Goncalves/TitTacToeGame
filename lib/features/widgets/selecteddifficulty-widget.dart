import 'package:flutter/material.dart';
import 'package:tictaetoos/core/fonts/app-fonts.dart';
import '../view/interface/playedScreen/controller/played-controller.dart';

class DifficultyButton extends StatelessWidget {
  final DifficultyLevel level;
  final String label;
  final DifficultyLevel? selectedDifficulty;
  final ValueChanged<DifficultyLevel> onSelected;

  const DifficultyButton({
    Key? key,
    required this.level,
    required this.label,
    required this.selectedDifficulty,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedDifficulty == level;

    return ElevatedButton(
      onPressed: () => onSelected(level),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFF0D0599).withOpacity(0.6) : Colors.white,
        minimumSize: const Size(100, 50),
      ),
      child: Text(label,style: appFonts.Text.copyWith(color: isSelected ? Colors.white : Colors.black ),),
    );
  }
}

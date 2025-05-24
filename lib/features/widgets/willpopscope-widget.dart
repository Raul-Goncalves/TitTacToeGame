import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tictaetoos/core/fonts/app-fonts.dart';

class popbox extends StatelessWidget {
  final Widget child;

  const popbox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog<bool>(
          context: context,
          builder:
              (_) => AlertDialog(
                title: Text('Sair do jogo', style: appFonts.Title),
                content: Text(
                  'Você tem certeza quer sair do jogo?',
                  style: appFonts.Text,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('Cancelar', style: appFonts.Text,),
                  ),
                  TextButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: Text('Sim', style: appFonts.Text,),
                  ),
                ],
              ).animate().fadeIn(),
        );
        return shouldExit ?? false;
      },
      child: child,
    );
  }
}

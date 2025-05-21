import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tictaetoos/core/fonts/app-fonts.dart';
import 'package:tictaetoos/features/view/interface/choseScreen/chose-view.dart';
import 'package:tictaetoos/features/widgets/button-widget.dart';
import 'package:tictaetoos/features/widgets/iconbutton-widget.dart';

class home_View extends StatefulWidget {
  const home_View({super.key});

  @override
  State<home_View> createState() => _home_ViewState();
}

class _home_ViewState extends State<home_View> {
  appFonts _fonts = appFonts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/interface/home/backgorund.png',
                fit: BoxFit.fill,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Image.asset('assets/images/interface/start/logo_velha.png'),
                  SizedBox(height: 30),
                  Text(
                    'Escolha o Modo de Jogo',
                    style: appFonts.Title.copyWith(
                      color: const Color(0xFF111043),
                    ),
                  ),
                  SizedBox(height: 75),
                  button_Widget(
                    text: 'Sozinho',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => chose_View()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ).animate().fadeIn(duration: 1.5.seconds),
      ),
    );
  }
}

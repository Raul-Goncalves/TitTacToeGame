import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tictaetoos/core/fonts/app-fonts.dart';
import 'package:tictaetoos/features/view/interface/playedScreen/played-view.dart';
import 'package:tictaetoos/features/widgets/button-widget.dart';
import 'package:tictaetoos/features/widgets/selecteddifficulty-widget.dart';
import 'package:tictaetoos/features/widgets/selectedplayer-widget.dart';

import '../playedScreen/controller/played-controller.dart';

class chose_View extends StatefulWidget {
  const chose_View({super.key});

  @override
  State<chose_View> createState() => _chose_ViewState();
}

class _chose_ViewState extends State<chose_View> {
  late String selectedPlayer;
  DifficultyLevel? selectedDifficulty;

  @override
  void initState() {
    super.initState();
    selectedPlayer = '';
  }

  Route _createRouteToPlayedScreen() {
    return PageRouteBuilder(
      pageBuilder:
          (context, animation, secondaryAnimation) => played_view(
            selectedPlayer: selectedPlayer,
            difficulty: selectedDifficulty ?? DifficultyLevel.medium,
          ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        final opacityTween = Tween<double>(begin: 0.0, end: 1.0);

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation.drive(opacityTween),
            child: child,
          ),
        );
      },
    );
  }

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
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Text(
                      'Quem vai escolher primeiro?',
                      style: appFonts.Title,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 150),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectedPlayerOption(
                          player: 'O',
                          isSelected: selectedPlayer == 'O',
                          onTap: () {
                            setState(() {
                              selectedPlayer = 'O';
                            });
                          },
                        ),
                        SizedBox(width: 50),
                        SelectedPlayerOption(
                          player: 'X',
                          isSelected: selectedPlayer == 'X',
                          onTap: () {
                            setState(() {
                              selectedPlayer = 'X';
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 80),
                    Text('Escolha a dificuldade', style: appFonts.Title),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DifficultyButton(
                          level: DifficultyLevel.easy,
                          label: 'Fácil',
                          selectedDifficulty: selectedDifficulty,
                          onSelected: (level) {
                            setState(() {
                              selectedDifficulty = level;
                            });
                          },
                        ),
                        DifficultyButton(
                          level: DifficultyLevel.medium,
                          label: 'Médio',
                          selectedDifficulty: selectedDifficulty,
                          onSelected: (level) {
                            setState(() {
                              selectedDifficulty = level;
                            });
                          },
                        ),
                        DifficultyButton(
                          level: DifficultyLevel.hard,
                          label: 'Difícil',
                          selectedDifficulty: selectedDifficulty,
                          onSelected: (level) {
                            setState(() {
                              selectedDifficulty = level;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 100),
                    if (selectedPlayer != null) ...[
                      Text(
                        'Você escolheu: $selectedPlayer',
                        style: appFonts.Title,
                      ).animate().fadeIn(),
                      SizedBox(height: 20),
                      button_Widget(
                        text: 'Iniciar jogo',
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushReplacement(_createRouteToPlayedScreen());
                        },
                      ).animate().fadeIn(),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

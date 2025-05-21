import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tictaetoos/core/fonts/app-fonts.dart';
import 'package:tictaetoos/features/view/interface/playedScreen/played-view.dart';
import 'package:tictaetoos/features/widgets/button-widget.dart';
import 'package:tictaetoos/features/widgets/selectedplayer-widget.dart';

class chose_View extends StatefulWidget {
  const chose_View({super.key});

  @override
  State<chose_View> createState() => _chose_ViewState();
}

class _chose_ViewState extends State<chose_View> {
  late String selectedPlayer;

  @override
  void initState() {
    super.initState();
    selectedPlayer = '';
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
                    SizedBox(height: 120),
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
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder:
                                  (context) => played_view(
                                    selectedPlayer: selectedPlayer,
                                  ),
                            ),
                          );
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictaetoos/core/fonts/app-fonts.dart';
import 'package:tictaetoos/features/view/interface/homeScreen/home-view.dart';
import 'package:tictaetoos/features/widgets/button-widget.dart';

import 'controller/played-controller.dart';

class played_view extends StatefulWidget {
  final String selectedPlayer;
  final DifficultyLevel difficulty;

  const played_view({super.key, required this.selectedPlayer, required this.difficulty});

  @override
  State<played_view> createState() => _played_viewState();
}

class _played_viewState extends State<played_view> {
  late PlayedController controller;

  @override
  void initState() {
    super.initState();
    controller = PlayedController(widget.selectedPlayer, widget.difficulty);
    controller.addListener(_update);
  }

  void _update() => setState(() {});

  @override
  void dispose() {
    controller.removeListener(_update);
    super.dispose();
  }

  Route _createRouteToHomeScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => home_View(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Text('X-${controller.xWins} | O-${controller.oWins}', style: appFonts.Title)),
                    SizedBox(height: 30),
                    Center(child: Text('É a vez do ${controller.currentPlayer}', style: appFonts.Title)),
                    SizedBox(height: 50),
                    Expanded(
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              height: 324,
                              width: 324,
                              decoration: BoxDecoration(
                                color: Color(0XFFDED4D4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: GridView.count(
                                crossAxisCount: 3,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                children: List.generate(9, (index) {
                                  final value = controller.board[index];
                                  return GestureDetector(
                                    onTap: () {
                                      if (!controller.isGameOver &&
                                          value == null) {
                                        controller.playerMove(index);
                                      }
                                    },
                                    child: Center(
                                      child: Container(
                                        width: 85,
                                        height: 85,
                                        decoration: BoxDecoration(
                                          color: Color(
                                            0xff000000,
                                          ).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            value == null
                                                ? SizedBox()
                                                : Image.asset(
                                                  value == 'X'
                                                      ? 'assets/images/interface/chose/x.png'
                                                      : 'assets/images/interface/chose/o.png',
                                                ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        controller.isGameOver
                            ? (controller.winner != null
                                ? 'O vencedor é: ${controller.winner}'
                                : 'Empate!')
                            : '',
                        style: appFonts.Title,
                      ),
                    ),
                    SizedBox(height: 50),
                    button_Widget(text: 'Reiniciar', onPressed: () {
                      controller.resetGame();
                    }),
                    SizedBox(height: 20),
                    button_Widget(
                      text: 'Sair',
                      onPressed: () {
                        Navigator.of(context).push(_createRouteToHomeScreen());
                      },
                    ),
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

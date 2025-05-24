import 'package:flutter/material.dart';
import 'package:tictaetoos/core/fonts/app-fonts.dart';
import 'package:tictaetoos/features/view/interface/choseScreen/chose-view.dart';
import 'package:tictaetoos/features/widgets/button-widget.dart';
import 'package:tictaetoos/features/widgets/willpopscope-widget.dart';

class home_View extends StatefulWidget {
  const home_View({super.key});

  @override
  State<home_View> createState() => _home_ViewState();
}

class _home_ViewState extends State<home_View> {
  appFonts _fonts = appFonts();

  Route _createRouteToChoseScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const chose_View(),
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
    return popbox(
      child: Scaffold(
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
                        Navigator.of(context).push(_createRouteToChoseScreen());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SplashController {

late final AnimationController _screenController;
late final AnimationController _logoController;

SplashController(TickerProvider tickerProvider, VoidCallback navigatorToNextScreen) {
  _screenController = AnimationController(
    lowerBound: 0,
    upperBound: 3,
    duration: const Duration(seconds: 2),
    vsync: tickerProvider,
  );

  _logoController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: tickerProvider,
  );

  _screenController.forward();
  _screenController.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      _logoController.forward();
    }
  });

  _logoController.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      navigatorToNextScreen();
    }
  });
}

AnimationController get screenController => _screenController;
AnimationController get logoController => _logoController;

void dispose() {
  _screenController.dispose();
  _logoController.dispose();
}
}
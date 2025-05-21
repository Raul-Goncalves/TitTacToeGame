import 'package:flutter/material.dart';
import 'package:tictaetoos/features/view/interface/homeScreen/home-view.dart';
import 'controller/splash-controller.dart';

class start_view extends StatefulWidget {
  const start_view({super.key});

  @override
  State<start_view> createState() => _start_viewState();
}

class _start_viewState extends State<start_view> with TickerProviderStateMixin {
  late SplashController _splashController;

  @override
  void initState() {
    super.initState();
    _splashController = SplashController(this, _navigatorNextPage);
  }

  void _navigatorNextPage() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => home_View()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Center(
          child: AnimatedBuilder(
            animation: _splashController.screenController,
            builder: (BuildContext context, Widget? child) {
              if (_splashController.screenController.value == 3) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    FadeTransition(
                      opacity: _splashController.logoController,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/interface/start/logo_velha.png'),
                            CircularProgressIndicator(color: Color(0xFF0d0599)),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return ScaleTransition(
                scale: _splashController.screenController,
                child: Container(
                  width: MediaQuery.of(context).size.height * _splashController.screenController.value,
                  height: MediaQuery.of(context).size.height * _splashController.screenController.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

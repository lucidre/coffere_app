import 'dart:async';

import 'package:coffere_app/model/coffee.dart';
import 'package:coffere_app/widgets/onboarding/coffee_onboarding.dart';
import 'package:flutter/material.dart';

class CoffeeHome extends StatefulWidget {
  const CoffeeHome({Key? key}) : super(key: key);

  @override
  _CoffeeHomeState createState() => _CoffeeHomeState();
}

class _CoffeeHomeState extends State<CoffeeHome> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future startTime() async {
    return Timer(const Duration(milliseconds: 5000), navigatePage);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.brown, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
          ),
          Positioned(
            height: size.height * 0.7,
            top: size.height * 0.15,
            left: 0,
            right: 0,
            child: Image.asset(
              coffees[9].image,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            height: size.height * 0.7,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              coffees[10].image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            height: size.height,
            left: 0,
            right: 0,
            bottom: -size.height * 0.8,
            child: Image.asset(
              coffees[11].image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            height: 140,
            left: 0,
            right: 0,
            bottom: size.height * 0.25,
            child: Image.asset("assets/images/logo.png"),
          ),
        ],
      ),
    );
  }

  void navigatePage() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 650),
        pageBuilder: (ctx, animation, _) {
          return FadeTransition(
            opacity: animation,
            child: const CoffeeOnBoarding(),
          );
        },
      ),
    );
  }
}

import 'package:coffere_app/library/intro_views_flutter-2.4.0/lib/Models/page_view_model.dart';
import 'package:coffere_app/library/intro_views_flutter-2.4.0/lib/intro_views_flutter.dart';
import 'package:coffere_app/model/coffee.dart';
import 'package:coffere_app/widgets/home/coffee_landing_page.dart';
import 'package:flutter/material.dart';

class CoffeeOnBoarding extends StatefulWidget {
  const CoffeeOnBoarding({Key? key}) : super(key: key);

  @override
  _CoffeeOnBoardingState createState() => _CoffeeOnBoardingState();
}

class _CoffeeOnBoardingState extends State<CoffeeOnBoarding> {
  final _fontHeaderStyle = const TextStyle(
      color: Colors.black,
      fontSize: 34.0,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5);
  final _fontDescriptionStyle = TextStyle(
      color: Colors.black.withOpacity(0.7),
      fontSize: 18.0,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w400);
  List<PageViewModel> pages = [];

  @override
  void initState() {
    pages = [
      PageViewModel(
        iconColor: Colors.brown,
        bubbleBackgroundColor: Colors.black,
        title: Text(
          'Lorem Ipsum Dolor?',
          style: _fontHeaderStyle,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent elementum a risus sed fringilla. Etiam quis venenatis nunc. Mauris efficitur tortor vitae risus consequat fringilla. Etiam fringilla mauris laoreet nisl fringilla, quis faucibus libero lobortis.',
            softWrap: true,
            overflow: TextOverflow.fade,
            style: _fontDescriptionStyle,
          ),
        ),
        mainImage: Hero(
          tag: "onboarding1",
          child: Image.asset(
            'assets/images/oboarding/coffee1.png',
            height: 500,
            fit: BoxFit.cover,
          ),
        ),
      ),
      PageViewModel(
        iconColor: Colors.brown,
        bubbleBackgroundColor: Colors.black,
        title: Text(
          'Lorem  Dolor Ipsum?',
          style: _fontHeaderStyle,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Sed quis porta metus. Sed vitae massa justo. Cras ornare feugiat orci et auctor. Ut sagittis mauris orci. Mauris non ante sit amet ipsum mollis rhoncus ac et arcu. ',
            softWrap: true,
            overflow: TextOverflow.fade,
            style: _fontDescriptionStyle,
          ),
        ),
        mainImage: Image.asset(
          'assets/images/oboarding/coffee2.png',
          height: 400,
          fit: BoxFit.cover,
        ),
      ),
      PageViewModel(
        iconColor: Colors.brown,
        bubbleBackgroundColor: Colors.black,
        title: Text(
          'Dolor Lorem Ipsum?',
          style: _fontHeaderStyle,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Vestibulum aliquam purus eget leo viverra hendrerit. Aenean orci arcu, tristique eget accumsan sit amet, porttitor at est',
            softWrap: true,
            overflow: TextOverflow.fade,
            style: _fontDescriptionStyle,
          ),
        ),
        mainImage: Hero(
          tag: coffees[7].name,
          child: Image.asset(
            'assets/images/oboarding/coffee3.png',
            height: 500,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IntroViewsFlutter(
          pages,
          skipText: Text(
            "SKIP",
            style: _fontDescriptionStyle.copyWith(
                color: Colors.brown,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0),
          ),
          doneText: Text(
            "OKAY!",
            style: _fontDescriptionStyle.copyWith(
                color: Colors.brown,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0),
          ),
          onTapDoneButton: () async {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 650),
                pageBuilder: (ctx, animation, _) {
                  return FadeTransition(
                    opacity: animation,
                    child: const CoffeeLandingPage(),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

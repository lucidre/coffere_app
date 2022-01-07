import 'package:coffere_app/model/coffee.dart';
import 'package:flutter/material.dart';

import 'details/coffee_details.dart';

void main() {
  runApp(const CoffeeList());
}

class CoffeeList extends StatefulWidget {
  const CoffeeList({Key? key}) : super(key: key);

  @override
  State<CoffeeList> createState() => _CoffeeListState();
}

const duration = Duration(milliseconds: 300);
const initPage = 8.0;

class _CoffeeListState extends State<CoffeeList> {
  final pageCoffeeController =
      PageController(viewportFraction: 0.35, initialPage: initPage.toInt());
  final pageTextController = PageController(initialPage: initPage.toInt());
  double currentPage = initPage;
  double textPage = initPage;

  void _textScrollListener() {
    setState(() {
      textPage = pageTextController.page ?? 0.0;
    });
  }

  void _coffeeScrollListener() {
    setState(() {
      currentPage = pageCoffeeController.page ?? 0.0;
    });
  }

  @override
  void initState() {
    super.initState();
    pageCoffeeController.addListener(_coffeeScrollListener);
    pageTextController.addListener(_textScrollListener);
  }

  @override
  void dispose() {
    pageCoffeeController.removeListener(_coffeeScrollListener);
    pageTextController.removeListener(_textScrollListener);
    pageCoffeeController.dispose();
    pageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            child: const DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.brown, blurRadius: 90, spreadRadius: 45),
                ],
              ),
            ),
            left: 20,
            right: 20,
            bottom: -size.height * 0.15,
            height: size.height * 0.4,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 100,
            child: _CoffeeHeader(
              textPage: textPage,
              pageTextController: pageTextController,
            ),
          ),
          Transform.scale(
            scale: 1.8,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              controller: pageCoffeeController,
              onPageChanged: (value) {
                if (value < coffees.length) {
                  pageTextController.animateToPage(value,
                      duration: duration, curve: Curves.easeOut);
                }
              },
              itemBuilder: (ctx, index) {
                if (index == 0) {
                  return const SizedBox.shrink();
                }

                final coffee = coffees[index - 1];
                final result = currentPage - index + 1;

                //result values for items on the screen to the new position
                //2=> 0.2
                //1=> 0.6
                //0=> 1

                final value = -0.4 * result + 1;

                final opacity = value.clamp(0.0, 1.0);

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 650),
                        pageBuilder: (ctx, animation, _) {
                          return FadeTransition(
                            opacity: animation,
                            child: CoffeeDetails(coffee: coffee),
                          );
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..scale(value)
                        ..translate(
                            0.0, (size.height / 2.6) * (1 - value).abs()),
                      child: Opacity(
                        opacity: opacity,
                        child: Hero(
                          tag: coffee.name,
                          child: Image.asset(
                            coffee.image,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: coffees.length + 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _CoffeeHeader extends StatelessWidget {
  final double textPage;
  final PageController pageTextController;

  const _CoffeeHeader({
    Key? key,
    required this.textPage,
    required this.pageTextController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return TweenAnimationBuilder<double>(
      builder: (ctx, value, child) {
        return Transform.translate(
          child: child,
          offset: Offset(
              0.0, -100 * value), // this makes the child come in from the top
        );
      },
      tween: Tween(begin: 1.0, end: 0.0),
      duration: duration,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageTextController,
              itemBuilder: (ctx, index) {
                final opacity = (1 - (index - textPage).abs()).clamp(0.0, 1.0);
                //if it is the right page the opacity is 1 else opacity is 0
                return Opacity(
                  opacity: opacity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
                    child: Hero(
                      tag: 'title_${coffees[index].name}',
                      child: Material(
                        child: Text(
                          coffees[index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: coffees.length,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          AnimatedSwitcher(
            duration: duration,
            child: Text(
              "\$${coffees[textPage.toInt()].price.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 22),
              key: Key(coffees[textPage.toInt()].name),
            ),
          )
        ],
      ),
    );
  }
}

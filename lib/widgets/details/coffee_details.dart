import 'package:coffere_app/model/coffee.dart';
import 'package:flutter/material.dart';

import 'coffee_details_body.dart';

class CoffeeDetails extends StatefulWidget {
  final Coffee coffee;

  const CoffeeDetails({Key? key, required this.coffee}) : super(key: key);

  @override
  _CoffeeDetailsState createState() => _CoffeeDetailsState();
}

const Duration animationDuration = Duration(milliseconds: 500);

class _CoffeeDetailsState extends State<CoffeeDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          backgroundColor(size),
          body(size),
          coffeeImage(size),
          coffeeHeader(size),
        ],
      ),
    );
  }

  Positioned body(Size size) {
    return Positioned(
      top: size.height / 2,
      left: 0,
      right: 0,
      child: Container(
        width: size.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white),
        height: size.height / 2,
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: CoffeeDetailsBody(coffee: widget.coffee),
      ),
    );
  }

  Positioned coffeeImage(Size size) {
    return Positioned(
      top: (size.height / 2) - 300,
      left: size.width * 0.2,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 0.0),
        duration: animationDuration,
        builder: (ctx, value, child) {
          return Transform.translate(
            offset: Offset(-100 * value, 0.0),
            child: child,
          );
        },
        child: Hero(
          tag: widget.coffee.name,
          child: Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.coffee.image),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Positioned coffeeHeader(Size size) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: const BackButton(
                color: Colors.white,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cart Clicked'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 300,
              margin: const EdgeInsets.only(left: 15, right: 15),
              width: 250,
              child: TweenAnimationBuilder<double>(
                duration: animationDuration,
                builder: (ctx, value, child) {
                  return Transform.scale(
                    child: child,
                    scale: value,
                  );
                },
                tween: Tween(begin: 0.0, end: 1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.coffee.name,
                      style: const TextStyle(
                          fontSize: 44,
                          shadows: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 10,
                              spreadRadius: 20,
                            )
                          ],
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$${widget.coffee.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 10,
                              spreadRadius: 20,
                            )
                          ],
                          fontSize: 40,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CoffeeDetailsCounter()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned backgroundColor(Size size) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: (size.height / 2) + 60,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.brown.shade800,
            Colors.brown,
            Colors.brown.shade400,
          ]),
        ),
      ),
    );
  }
}

class CoffeeDetailsCounter extends StatefulWidget {
  const CoffeeDetailsCounter({Key? key}) : super(key: key);

  @override
  _CoffeeDetailsCounterState createState() => _CoffeeDetailsCounterState();
}

class _CoffeeDetailsCounterState extends State<CoffeeDetailsCounter> {
  int currentCount = 1;

  void increment() {
    setState(() {
      currentCount++;
    });
  }

  void decrement() {
    if (currentCount != 1) {
      setState(() {
        currentCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: increment,
            ),
            const SizedBox(
              height: 15,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                currentCount.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            IconButton(
              onPressed: decrement,
              icon: Icon(
                Icons.minimize,
                color: currentCount > 1 ? Colors.black : Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*

class CoffeeDetails extends StatefulWidget {
  final Coffee coffee;

  const CoffeeDetails({Key? key, required this.coffee}) : super(key: key);

  @override
  _CoffeeDetailsState createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: const DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.brown, blurRadius: 90, spreadRadius: 55),
                ],
              ),
            ),
            left: 20,
            right: 20,
            top: -size.height * 0.2,
            height: size.height * 0.5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: const BackButton(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
                child: Hero(
                  tag: 'title_${widget.coffee.name}',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      widget.coffee.name,
                      maxLines: 2,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height * 0.45,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Hero(
                        tag: widget.coffee.image,
                        child: Image.asset(
                          widget.coffee.image,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.2,
                      bottom: 0,
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          "\$${widget.coffee.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                              color: Colors.white,
                              shadows: [
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 10,
                                  spreadRadius: 20,
                                )
                              ],
                              fontSize: 45,
                              fontWeight: FontWeight.w900),
                        ),
                        builder: (ctx, value, child) {
                          return Transform.scale(
                            child: child,
                            scale: value,
                          );
                        },
                        tween: Tween(begin: 0.0, end: 1.0),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




*/

//
//
// return Scaffold(
// body: Stack(
// children: [
// /*  Positioned(
//             child: const DecoratedBox(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.brown, blurRadius: 90, spreadRadius: 55),
//                 ],
//               ),
//             ),
//             left: 20,
//             right: 20,
//             top: -size.height * 0.2,
//             height: size.height * 0.5,
//           ),*/
// /*Stack(
//             children: [
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   height: size.height * 0.4,
//                   alignment: Alignment.topLeft,
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(50),
//                     ),
//                     color: Colors.brown,
//                   ),
//                   child: AppBar(
//                     elevation: 0,
//                     backgroundColor: Colors.transparent,
//                     leading: const BackButton(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: -60,
//                 top: size.height * 0.15,
//                 child: Hero(
//                   tag: widget.coffee.image,
//                   child: Image.asset(
//                     'assets/images/oboarding/coffee2.png',
//                     height: 300,
//                     fit: BoxFit.fitHeight,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 60,
//                   child: const Icon(
//                     Icons.favorite,
//                     color: Colors.red,
//                     size: 30,
//                   ),
//                   width: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: const [
//                       BoxShadow(color: Colors.black26, offset: Offset(4, 4))
//                     ],
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 left: 50,
//                 top: (size.height * 0.4) - 30,
//               )
//               //position the heart at right 40 top  size * 0.3 - 30 where 30 is the size of the like button use container for the button
//
//               *//*  Padding(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
//                 child: Hero(
//                   tag: 'title_${widget.coffee.name}',
//                   child: Material(
//                     color: Colors.transparent,
//                     child: Text(
//                       widget.coffee.name,
//                       maxLines: 2,
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 30,
//                           fontWeight: FontWeight.w700),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               SizedBox(
//                 height: size.height * 0.45,
//                 child: Stack(
//                   children: [
//
//                     Positioned(
//                       left: size.width * 0.2,
//                       bottom: 0,
//                       child: TweenAnimationBuilder<double>(
//                         duration: const Duration(milliseconds: 500),
//                         child: Text(
//                           "\$${widget.coffee.price.toStringAsFixed(2)}",
//                           style: const TextStyle(
//                               color: Colors.white,
//                               shadows: [
//                                 BoxShadow(
//                                   color: Colors.black45,
//                                   blurRadius: 10,
//                                   spreadRadius: 20,
//                                 )
//                               ],
//                               fontSize: 45,
//                               fontWeight: FontWeight.w900),
//                         ),
//                         builder: (ctx, value, child) {
//                           return Transform.scale(
//                             child: child,
//                             scale: value,
//                           );
//                         },
//                         tween: Tween(begin: 0.0, end: 1.0),
//                       ),
//                     )
//                   ],
//                 ),
//               ),*//*
//             ],
//           ),*/
// ],
// ),
// );

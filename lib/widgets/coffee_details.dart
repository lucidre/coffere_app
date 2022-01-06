import 'package:coffere_app/model/coffee.dart';
import 'package:flutter/material.dart';

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

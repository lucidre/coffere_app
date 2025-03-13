import 'package:coffere_app/model/coffee.dart';
import 'package:coffere_app/widgets/coffee_list.dart';

import 'package:flutter/material.dart';

const Duration animationDuration = Duration(milliseconds: 500);

class CoffeeLandingPage extends StatefulWidget {
  const CoffeeLandingPage({Key? key}) : super(key: key);

  @override
  _CoffeeLandingPageState createState() => _CoffeeLandingPageState();
}

class _CoffeeLandingPageState extends State<CoffeeLandingPage> {
  final _pageController = PageController(viewportFraction: 0.75);

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Menu Clicked"),
              ),
            );
          },
          icon: const Icon(Icons.menu, color: Colors.white)),
      title: Container(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/logo.png",
          height: 40,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Cof-Cart Clicked"),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.white))
      ],
    );
  }

  Positioned buildBackground(Size size) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height * 0.5,
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

  Widget buildHeader() {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Welcome',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 50, color: Colors.white, shadows: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
                spreadRadius: 20,
              )
            ]),
          ),
          Text(
            'to the home of coffee!!',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 25, color: Colors.white, shadows: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
                spreadRadius: 20,
              )
            ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          buildBackground(size),
          Positioned(
            top: (size.height * 0.3) - 300,
            left: size.width * 0.45,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 1.0, end: 0.0),
              duration: animationDuration,
              builder: (ctx, value, child) {
                return Transform.translate(
                  offset: Offset(-100 * value, 0.0),
                  child: child,
                );
              },
              child: Container(
                height: 380,
                width: 380,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/oboarding/coffee1.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.3,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: /* Column(
                    children: [
                        buildSearchBar(),
                      buildCategoryList(),
                      buildItemList(),
                    ],
                  ),*/
                      const CoffeeList(),
                ),
              ),
            ],
          ),
          Positioned(
            top: (size.height * 0.15),
            left: 0,
            child: buildHeader(),
          ),
          Positioned(
            child: buildAppBar(),
            top: 0,
            right: 0,
            left: 0,
          ),
        ],
      ),
    );
  }

  SingleChildScrollView buildItemList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: coffees.map((coffee) => ItemCard(coffee: coffee)).toList(),
      ),
    );
  }

  SingleChildScrollView buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CategoryItem(
            title: "Coffee",
            isActive: true,
          ),
          CategoryItem(
            title: "Meat",
          ),
          CategoryItem(
            title: "Drink",
          ),
          CategoryItem(
            title: "Chicken",
          ),
          CategoryItem(
            title: "Cocoa",
          ),
          CategoryItem(
            title: "Coffee",
          ),
        ],
      ),
    );
  }

  Container buildSearchBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.brown.withOpacity(0.32),
        ),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search Coffee',
          icon: Icon(
            Icons.search,
            color: Colors.brown,
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Coffee coffee;

  const ItemCard({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 8),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: 150,
              height: 200,
              child: Image.asset(
                coffee.image,
                fit: BoxFit.fill,
              ),
              decoration: BoxDecoration(
                color: Colors.brown.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              coffee.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "USD ${coffee.price.toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final bool isActive;
  final String title;

  const CategoryItem({
    Key? key,
    this.isActive = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        children: [
          Text(
            title,
            style: isActive
                ? const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)
                : const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 3,
              width: 22,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
            )
        ],
      ),
    );
  }
}

/*
  SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        coffees.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Text(
                            coffees[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (ctx, index) {
                    final coffee = coffees[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 60.0),
                      child: Transform.translate(
                        offset: const Offset(20, 0),
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: Colors.white,
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 40.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        coffee.name,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        coffee.name,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        coffee.price.toStringAsFixed(2),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          coffee.name,
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: constraints.maxHeight * 0.2,
                                  bottom: constraints.maxHeight * 0.2,
                                  left: constraints.maxWidth * 0.05,
                                  right: -constraints.maxWidth * 0.16,
                                  child: Image(
                                    image: AssetImage(coffee.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(36),
                                          bottomRight: Radius.circular(36),
                                        ),
                                      ),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: InkWell(
                                        onTap: () {},
                                        child: const SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Icon(
                                            Icons.add,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          );
                        }),
                      ),
                    );
                  },
                  controller: _pageController,
                  itemCount: coffees.length,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
              Container(
                height: 120,
              )
 */

/*

class _CoffeeLandingPageState extends State<CoffeeLandingPage> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      height: size.height,
      child: Stack(
        children: [
          buildBackground(size),
          Positioned(
            top: (size.height * 0.4) - 350,
            left: size.width * 0.3,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 1.0, end: 0.0),
              duration: animationDuration,
              builder: (ctx, value, child) {
                return Transform.translate(
                  offset: Offset(-100 * value, 0.0),
                  child: child,
                );
              },
              child: Container(
                height: 400,
                width: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/oboarding/coffee1.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          buildAppBar(context),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.2,
                ),
                buildHeader(),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (ctx, item) {
                            final Coffee coffee = coffees[item];
                            return Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              margin: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 8, bottom: 8),
                              child: Stack(
                                children: [
                                  Container(
                                    width: size.height * 0.6,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          coffee.name,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "USD ${coffee.price.toStringAsFixed(2)}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          coffee.about,
                                          maxLines: 3,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      top: 10,
                                      left: size.height * 0.4,
                                      child: Image.asset(coffee.image,
                                          height: 100, fit: BoxFit.fitWidth)),
                                ],
                              ),
                            );
                          },
                          itemCount: coffees.length,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.3,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildHeader() {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Welcome',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 50, color: Colors.white, shadows: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
                spreadRadius: 20,
              )
            ]),
          ),
          Text(
            'to the home of coffee!!',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 25, color: Colors.white, shadows: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
                spreadRadius: 20,
              )
            ]),
          ),
        ],
      ),
    );
  }

  Positioned buildAppBar(BuildContext context) {
    return Positioned(
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Image.asset(
          "assets/images/logo.png",
          height: 60,
        ),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Cof-Cart Clicked"),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart, color: Colors.white))
        ],
      ),
      top: 0,
      left: 0,
      right: 0,
    );
  }

  Positioned buildBackground(Size size) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height * 0.5,
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







*/

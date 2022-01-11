import 'package:coffere_app/model/coffee.dart';
import 'package:coffere_app/widgets/details/coffee_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Duration animationDuration = Duration(milliseconds: 500);

class CoffeeLandingPage extends StatefulWidget {
  const CoffeeLandingPage({Key? key}) : super(key: key);

  @override
  _CoffeeLandingPageState createState() => _CoffeeLandingPageState();
}

class _CoffeeLandingPageState extends State<CoffeeLandingPage> {
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
          color: Colors.white,
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
            Colors.white,
          ]),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      width: 500,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'Online Coffee',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Delivery!',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 27,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var textStyleBody = const TextStyle(
      fontSize: 18,
      color: Colors.black,
    );
    var textStyleHeader = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomAppBar(),
      body: Stack(
        children: [
          const SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.brown,
                  Colors.white,
                  Colors.white,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
          ),
          Positioned(
            top: (size.height * 0.5) - 380,
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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppBar(),
                const SizedBox(
                  height: 20,
                ),
                buildHeader(),
                const SizedBox(
                  height: 40,
                ),
                buildSearchBar(),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTips(textStyleHeader, textStyleBody),
                      const SizedBox(
                        height: 20,
                      ),
                      buildCategory(textStyleHeader),
                      const SizedBox(
                        height: 20,
                      ),
                      buildItems(textStyleHeader)
                      //  buildCategoryList(),
                    ],
                  ),
                ),

                /* Positioned(
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
                        child: */ /* Column(
                          children: [
                              buildSearchBar(),
                            buildCategoryList(),
                            buildItemList(),
                          ],
                        ),*/ /*
                            const CoffeeList(),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  child: buildAppBar(),
                  top: 0,
                  right: 0,
                  left: 0,
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildCategory(TextStyle textStyleHeader) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.category,
          color: Colors.black,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Category:',
                style: textStyleHeader,
              ),
              const SizedBox(
                height: 3,
              ),
              buildItemList(),
            ],
          ),
        ),
      ],
    );
  }

  Row buildItems(TextStyle textStyleHeader) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.coffee,
          color: Colors.black,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Coffee!',
                style: textStyleHeader,
              ),
              const SizedBox(
                height: 3,
              ),
              ListView.builder(
                padding: const EdgeInsets.all(0),
                itemBuilder: (ctx, index) {
                  final coffee = coffees[index];
                  return HomeItemCard(coffee: coffee);
                },
                itemCount: coffees.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              )
            ],
          ),
        ),
      ],
    );
  }

  Row buildTips(TextStyle textStyleHeader, TextStyle textStyleBody) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.info,
          color: Colors.black,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Coffee Tip:',
                style: textStyleHeader,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent elementum a risus sed fringilla. Etiam quis venenatis nunc. Mauris efficitur tortor vitae risus consequat fringilla. Etiam fringilla mauris laoreet nisl fringilla, quis faucibus libero lobortis.',
                softWrap: true,
                style: textStyleBody,
              ),
            ],
          ),
        ),
      ],
    );
  }

  SingleChildScrollView buildItemList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: coffeeTypes
            .map((coffeeType) => ItemCard(
                  coffeeType: coffeeType,
                  isSelected: coffeeTypes.indexOf(coffeeType) == 0,
                ))
            .toList(),
      ),
    );
  }

  SingleChildScrollView buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
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
      ),
    );
  }

  Widget buildSearchBar() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search for your coffee',
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class HomeItemCard extends StatefulWidget {
  const HomeItemCard({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  State<HomeItemCard> createState() => _HomeItemCardState();
}

class _HomeItemCardState extends State<HomeItemCard> {
  bool _isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 650),
              pageBuilder: (ctx, animation, _) {
                return FadeTransition(
                  opacity: animation,
                  child: CoffeeDetails(coffee: widget.coffee),
                );
              },
            ),
          );
        },
        child: Container(
          height: 130,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.coffee.name,
                      maxLines: 1,
                      softWrap: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '\$${widget.coffee.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      icon: _isFavourite
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border),
                      onPressed: () {
                        setState(() {
                          _isFavourite = !_isFavourite;
                        });
                      },
                      color: _isFavourite ? Colors.brown : Colors.black,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.brown.shade200,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Image.asset(
                  widget.coffee.image,
                  fit: BoxFit.scaleDown,
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomAppBar extends StatefulWidget {
  const BottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomAppBar> createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomAppBar> {
  int _selectedPos = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF180A01).withOpacity(0.1),
                offset: const Offset(0, -7),
                blurRadius: 33)
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          appBarButtons('Home', Icons.home, 0),
          appBarButtons('Shop', Icons.shopping_cart, 1),
          appBarButtons('Profile', Icons.person, 2),
          appBarButtons('Settings', Icons.settings, 3),
        ],
      ),
    );
  }

  Widget appBarButtons(String title, IconData icon, int position) {
    bool isSelected = _selectedPos == position;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPos = position;
        });
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.brown.shade200 : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: (isSelected) ? 24 : 22,
              color:
                  (isSelected) ? Colors.white : Colors.black.withOpacity(0.6),
            ),
            if (isSelected)
              const SizedBox(
                width: 5,
              ),
            if (isSelected)
              Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              )
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final CoffeeType coffeeType;
  final bool isSelected;

  const ItemCard({
    Key? key,
    required this.coffeeType,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 8),
        color: isSelected ? Colors.brown.shade100 : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Icon(
                coffeeType.image,
                color: Colors.black,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              coffeeType.name,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 23),
            ),
            const SizedBox(
              height: 10,
            ),
            CircleAvatar(
              backgroundColor: isSelected ? Colors.black : Colors.white,
              child: Icon(
                Icons.navigate_next,
                color: isSelected ? Colors.white : Colors.black,
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
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
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
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
            )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../model/coffee.dart';

class CoffeeDetailsBody extends StatelessWidget {
  final Coffee coffee;

  const CoffeeDetailsBody({Key? key, required this.coffee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyleBody = const TextStyle(
      fontSize: 18,
      color: Colors.black,
    );
    var textStyleHeader = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 70,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.info_sharp,
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
                      'About',
                      style: textStyleHeader,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      coffee.about,
                      style: textStyleBody,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.timelapse_rounded,
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
                      'Preparation Time',
                      style: textStyleHeader,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      coffee.prepTime,
                      style: textStyleBody,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.info_outline,
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
                      'Nutrition Information',
                      style: textStyleHeader,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      coffee.nutritionInfo,
                      style: textStyleBody,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.list,
                color: Colors.black,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Ingredients',
                style: textStyleHeader,
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: coffee.ingredients
                  .map((element) => IngredientsWidget(ingredients: element))
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.brown,
                elevation: 5,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Cart Clicked'),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Add To Cof-Cart',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class IngredientsWidget extends StatelessWidget {
  final Ingredients ingredients;

  const IngredientsWidget({Key? key, required this.ingredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyleBody = const TextStyle(
      fontSize: 18,
    );
    return Container(
      width: 60,
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            child: Icon(ingredients.iconData, color: Colors.white),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ingredients.color,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            ingredients.title,
            textAlign: TextAlign.center,
            style: textStyleBody,
          ),
        ],
      ),
    );
  }
}

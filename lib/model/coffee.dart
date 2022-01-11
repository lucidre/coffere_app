import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double _doubleInRange(Random source, num start, num end) =>
    source.nextDouble() * (end - start) + start;

final random = Random();

final coffeeTypes = [
  CoffeeType('Coffee', Icons.image),
  CoffeeType('Fika', Icons.coffee),
  CoffeeType('Lotte', Icons.image),
  CoffeeType('Coffee', Icons.image),
  CoffeeType('Fika', Icons.coffee),
  CoffeeType('Lotte', Icons.image),
];

class CoffeeType {
  final String name;
  final IconData image;

  CoffeeType(this.name, this.image);
}

final coffees = [
  Coffee(
    name: 'Batch Brew',
    image: 'assets/images/oboarding/coffee1.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'A batch brew is a coffee made in an automated pour over machine, like a Moccamaster. These machines use a filter and brew much larger quantities of coffee than devices like the AeroPress, V60 or Chemex.',
    prepTime: '8 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Cold Drip',
    image: 'assets/images/oboarding/coffee2.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'Cold drip coffee is similar to coffee brewed in a pour-over device, except that the process uses cold water and takes much longer. Our Merlo stores use a Yama cold drip tower to make cold drip coffee.',
    prepTime: '7 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Cold Brew',
    image: 'assets/images/oboarding/coffee3.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'Our Cold Brew coffee can is produced by submerging our premium Zambia coffee beans in cold water for an extended period of time. This results in a smooth and refreshing brew with 180mg of caffeine - similar to a double-shot espresso.',
    prepTime: '7 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Espresso',
    image: 'assets/images/1.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'Also known as a short black, an espresso is a single shot of coffee. No extra hot water is added, resulting in an intense and flavoursome drink.',
    prepTime: '10 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Doppio',
    image: 'assets/images/2.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'A Doppio is a double shot of espresso with no added hot water or milk. This results in 60 ml of coffee. Doppio means \'double\' in Italian.',
    prepTime: '6 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Ristretto',
    image: 'assets/images/3.png',
    price: _doubleInRange(random, 3, 7),
    about:
        "A ristretto, which means 'restricted' in Italian, is a shot of espresso coffee but extracted with half the amount of water.",
    prepTime: '7 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Long Black',
    image: 'assets/images/4.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'A long black is made by pouring a double-shot of espresso over hot water. ',
    prepTime: '15 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Short Macchiato',
    image: 'assets/images/5.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'A short macchiato is served in a small glass consisting of a single espresso shot then filled with creamy steamed milk and finished with a small layer of foam.',
    prepTime: '10 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Long Macchiato',
    image: 'assets/images/6.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'A long macchiato is similar to a short macchiato, except that it contains a double shot (around 60ml) of coffee.',
    prepTime: '17 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Mezzo Mezzo (Piccolo)',
    image: 'assets/images/7.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'A mezzo mezzo (also known as a piccolo) is a single espresso shot in a small latte glass, which is then filled with steamed milk.',
    prepTime: '5 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Cappuccino',
    image: 'assets/images/8.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'Recognised by the froth on top, a cappuccino is one part espresso shot, one part textured milk and one part froth on top with a dusting of chocolate to finish.',
    prepTime: '8 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Latte',
    image: 'assets/images/9.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'A latte is a coffee espresso shot filled with steamed milk and with a layer of foamed milk crema.',
    prepTime: '8 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Flat White',
    image: 'assets/images/10.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'A flat white is very similar to a latte, with un-textured milk (no air incorporated when being steamed) resulting in espresso and steamed milk with little or no froth.',
    prepTime: '5 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Mocha',
    image: 'assets/images/11.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'A latte with the added sweetness of chocolate. A mocha can be prepared by adding chocolate to the espresso shot before adding the textured milk, or adding the chocolate to the cold milk before frothing.',
    prepTime: '5 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
  Coffee(
    name: 'Affogato',
    image: 'assets/images/12.png',
    price: _doubleInRange(random, 3, 7),
    about:
        'Combine a scoop of vanilla ice cream and a double shot of hot espresso and you have an affogato. Great for a post-lunch or dinner treat.',
    prepTime: '8 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: [
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Self-raising Flour',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: '2 Large Eggs',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: '2 tsp Instant Coffee',
          iconData: Icons.timelapse,
          color: Colors.green),
      Ingredients(
          title: 'Light Muscovado Sugar',
          iconData: Icons.image,
          color: Colors.brown),
      Ingredients(
          title: 'Mascarpone',
          iconData: Icons.wrong_location_sharp,
          color: Colors.orange),
      Ingredients(
          title: 'Soft Cheese', iconData: Icons.image, color: Colors.brown),
    ],
  ),
];

class Coffee {
  final String name;
  final String image;
  final double price;
  final String about;
  final String prepTime;
  final String nutritionInfo;
  final List<Ingredients> ingredients;

  Coffee({
    required this.name,
    required this.image,
    required this.price,
    required this.about,
    required this.prepTime,
    required this.nutritionInfo,
    required this.ingredients,
  });
}

class Ingredients {
  final String title;
  final IconData iconData;
  final MaterialColor color;

  Ingredients(
      {required this.title, required this.iconData, required this.color});
}

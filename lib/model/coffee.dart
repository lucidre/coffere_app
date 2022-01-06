import 'dart:math';

double _doubleInRange(Random source, num start, num end) =>
    source.nextDouble() * (end - start) + start;

final _names = [
  'Hot 1 Red Coffee',
  'The Friendly Bean',
  'Club Coffee',
  'Catchy Coffee Shop Name Ideas',
  'Aroma Mocha	Grinders',
  'Cafe	Steamy Beans Coffee',
  'Club Coffee Jumping',
  'Beans Cafe',
  'The Friendly Bean',
  'Coffee Express Jumpstart',
  'Coffee Grind',
  'Java	The Hideout'
];
final random = Random();
final coffees = List.generate(
    _names.length,
    (index) => Coffee(
        name: _names[index],
        image: 'assets/images/${index + 1}.png',
        price: _doubleInRange(random, 3, 7)));

class Coffee {
  final String name;
  final String image;
  final double price;

  Coffee({required this.name, required this.image, required this.price});
}

import 'package:coffere_app/widgets/coffee_home.dart';
import 'package:coffere_app/widgets/coffee_list.dart';
import 'package:coffere_app/widgets/home/coffee_landing_page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'ProximaNova'),
      home: const CoffeeHome(),
    );
  }
}

import 'package:coffee_app_ui/util/coffee_tile.dart';
import 'package:coffee_app_ui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    [
      "Cappuccino",
      true,
    ],
    [
      "Latte",
      false,
    ],
    [
      "Americano",
      false,
    ],
    [
      "Espresso",
      false,
    ],
    [
      "Mocha",
      false,
    ],
    [
      "Instant",
      false,
    ],
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
      ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Find the best coffee for you",
            style: GoogleFonts.bebasNeue(
              fontSize: 56,
            ),
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search coffee...",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600)),
            ),
          ),
        ),
        const SizedBox(height: 25.0),
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coffeeType.length,
            itemBuilder: (context, index) {
              return CoffeeType(
                coffeeType: coffeeType[index][0],
                isSelected: coffeeType[index][1],
                onTap: () {
                  coffeeTypeSelected(index);
                },
              );
            },
          ),
        ),
        Expanded(
            child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            CoffeeTile(
              coffeeImagePath: "images/coffee1.jpg",
              coffeeName: "Cappuccino",
              coffeePrice: "6.0",
            ),
            CoffeeTile(
              coffeeImagePath: "images/coffee2.jpg",
              coffeeName: "Cappuccino",
              coffeePrice: "5.0",
            ),
            CoffeeTile(
              coffeeImagePath: "images/coffee3.jpg",
              coffeeName: "Cappuccino",
              coffeePrice: "4.0",
            ),
          ],
        ))
      ]),
    );
  }
}

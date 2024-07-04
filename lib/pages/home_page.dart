import 'package:coffee/util/coffee_tile.dart';
import 'package:coffee/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    //coffee type ,isSelected
    ['Cappucino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false],
  ];

  //user tapped on coffee types

  void coffeeTypesSelected(int index) {
    setState(() {
      for(int i = 0; i <coffeeType.length ; i++){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '')
        ],
      ),
      body: Column(
        children: [
          //the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //horizontal list view of coffe types
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
                        coffeeTypesSelected(index);
                      },
                    );
                  })),

          //horizontal list view of coffe titles
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CoffeeTile(coffeImagePath: 'lib/images/cuppcino.jpg', coffeeName: 'cappucino',coffeePrice: '4.20',),
               CoffeeTile(coffeImagePath: 'lib/images/milk.jpg', coffeeName: 'coffee milk',coffeePrice: '4.50',),
               CoffeeTile(coffeImagePath: 'lib/images/latte.jpg', coffeeName: 'latte',coffeePrice: '4.00',),
               
              ],
          )),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

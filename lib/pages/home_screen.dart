import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/category_list.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                // Header
                Container(
                  height: 220,
                  color: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('assets/profile.jpg'),
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Icon(Icons.menu, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Hello , Abdelrhman",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "What do you want to buy?",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                CategoryList(categories: categories, icons: icons),
                ListView.builder(
                  itemCount: dummyProducts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ProductCard(product: dummyProducts[index]),
                        const SizedBox(height: 15),
                      ],
                    );
                  },
                ),
              ],
            ),
            Positioned(
              top: 195,
              left: 20,
              right: 20,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon:
                        Icon(Icons.search, color: Colors.yellow.shade800),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chair), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

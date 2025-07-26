import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<String> categories;
  final List<IconData> icons;

  const CategoryList({super.key, required this.categories, required this.icons});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icons[index],
                      size: 50,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      categories[index],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

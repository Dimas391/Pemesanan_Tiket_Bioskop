import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grab A Bite!', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepPurple,
          actions: const [
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 16),
          ],
        ),
        body: const CategoryPage(),
      ),
    );
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int selectedCategoryIndex = 0;

  final List<String> categories = ["All", "Combos", "Snacks", "Beverages", "Popcorn"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.deepPurple,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: selectedCategoryIndex == index ? Colors.white : Colors.grey[300],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: const [
              MenuItem(
                name: "Large Pepsi 810ml",
                details: "348 Kcal | Allergens: Caffeine",
                price: "25.000",
                image: "assets/pepsi.png",
              ),
              MenuItem(
                name: "Spicy Chicken Focaccia Sandwich 190g",
                details: "456 Kcal | Allergens: Milk, Wheat, Gluten",
                price: "50.000",
                image: "assets/sandwich.png",
              ),
              MenuItem(
                name: "Crispy Paneer Burger 170g",
                details: "653 Kcal | Allergens: Milk, Wheat, Soybean, Gluten",
                price: "35.000",
                image: "assets/burger.png",
              ),
              MenuItem(
                name: "Ayam Goreng (Salted)",
                details: "1159 Kcal | Allergens: Milk, Caffeine",
                price: "15.000",
                image: "assets/combo2.png",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final String name;
  final String details;
  final String price;
  final String image;

  const MenuItem({
    super.key,
    required this.name,
    required this.details,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(details, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            Text(price, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 30, 233, 77),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}

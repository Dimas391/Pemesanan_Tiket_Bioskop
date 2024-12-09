import 'package:flutter/material.dart';
import 'home.dart';
import 'film_hindi.dart';
import 'film_marathi.dart';

class SnackPage extends StatefulWidget {
  @override
  _SnackPageState createState() => _SnackPageState();
}

class _SnackPageState extends State<SnackPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  var _selectedIndex = 3;
  return Scaffold(
    backgroundColor: Color(0xFF1F1B2C),
    appBar: AppBar(
      title: Text('Grab A Bite!'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    body: Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white54),
              prefixIcon: Icon(Icons.search, color: Colors.white),
              filled: true,
              fillColor: Colors.black26,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // TabBar for Categories
        TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.pink,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Combos'),
            Tab(text: 'Snacks'),
            Tab(text: 'Beverages'),
            Tab(text: 'Popcorn'),
          ],
        ),

        // Snack List
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildSnackList(),
              _buildSnackList(), // Placeholder for other tabs
              _buildSnackList(),
              _buildSnackList(),
              _buildSnackList(),
            ],
          ),
        ),
      ],
    ),

     bottomNavigationBar: BottomNavigationBar(
  backgroundColor: Colors.transparent,
  elevation: 2,
  selectedItemColor: Color(0xFF00C9FF), // Warna biru muda
  unselectedItemColor: Colors.grey, // Warna abu-abu untuk item yang tidak dipilih
  currentIndex: _selectedIndex,
  onTap: (index) {
    setState(() {
      _selectedIndex = index; // Pastikan mengubah sesuai tab yang diklik
      if (_selectedIndex == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => homepage()),
        );
      } else if (_selectedIndex == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => marathiMoviesPage()),
        );
      } else if (_selectedIndex == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SnackPage()),
        );
      } else if (_selectedIndex == 3) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SnackPage()),
        );
      }
    });
  },
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.location_on),
      label: 'Location',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today),
      label: 'Calendar',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
),

    );
  }
  
}


Widget _buildSnackList() {
  final snacks = [
    {
      'title': 'Large Pepsi 810ml',
      'description': 'Large Pepsi 810ml (348 Kcal) | Allergens: Caffeine',
      'price': '₹429.45',
      'image': 'images/menu/1.png',
    },
   {
      'title': 'Spicy Chicken Focacsia Sandwich 190g',
      'description': 'Spicy Chicken Focaccia Sandwich 190g (456 Kcal Allergens, Milk, Wheat, Gluten)',
      'price': '₹299.25',
      'image': 'images/menu/2.jpg',
    },
    {
      'title': 'Crispy Paneer Burger 170g',
      'description': 'Crispy Paneer Burger 170g (653 Kcal | Allergens: Milk, Wheat, Soybean, Gluten)',
      'price': '₹319.20',
      'image': 'images/menu/3.jpeg',
    },
    {
      'title': 'Large Pepsi 810ml',
      'description': 'Large Pepsi 810ml (348 Kcal) | Allergens: Caffeine',
      'price': '₹429.45',
      'image': 'images/menu/1.png',
    },
    {
      'title': 'Combo 2 (Salted)',
      'description': 'Salted Popcorn 180g +2 Pepsi 360ml (1159 kcal | Allergens: Milk, Caffeine)',
      'price': '₹988.05',
      'image': 'images/menu/7.png',
    },
     {
      'title': 'Paneer Tikka Sandwich 190g',
      'description': 'Paneer Tikka Sandwich 190g (529 Kcal | Allergens Milk, Wheat, Soybean, Gluten)',
      'price': '₹319.20',
      'image': 'images/menu/9.png',
    },
     {
      'title': 'Strawberry & Mint Mocktail 450ml',
      'description': 'Strawberry & Mint Mocktail 450ml (238 Kcal)',
      'price': '₹339.15',
      'image': 'images/menu/4.jpeg',
    },
     {
      'title': 'Large Caramel Popcorn 180g',
      'description': 'Large Caramel Popcorn 180g (826 Kcal | Allergens: Soybean)',
      'price': '₹518.70',
      'image': 'images/menu/7.png',
    },
     {
      'title': 'Green Apple & Cucumber Lemonade 450ml',
      'description': 'Green Apple & Cucumber Lemonade (450ml 234 Kcal)',
      'price': '₹339.15',
      'image': 'images/menu/6.jpeg',
    },
     {
      'title': 'Spicy Grilled Chicken Burger 170g',
      'description': 'Spicy Grilled Chicken Burger 170g (669 Kcal | Allergens: Milk, Gluten)',
      'price': '₹339.15',
      'image': 'images/menu/3.jpeg',
    },
  ];

  return ListView.builder(
    padding: EdgeInsets.all(16),
    itemCount: snacks.length,
    itemBuilder: (context, index) {
      final snack = snacks[index];
      return Card(
        color: Colors.black26,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              snack['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(snack['title']!, style: TextStyle(color: Colors.white)),
          subtitle: Text(
            snack['description']!,
            style: TextStyle(color: Colors.white70, fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                snack['price']!, 
                style: TextStyle(color: Colors.white)
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    // Add to cart functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added to cart'))
                    );
                  },
                  child: Text('Add', style: TextStyle(fontSize: 12)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  
}
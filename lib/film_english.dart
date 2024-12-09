import 'package:flutter/material.dart';
import 'film_hindi.dart';
import 'film_marathi.dart';
import 'film_indonesia.dart';
import 'film_horor.dart';

class EnglishMoviesPage extends StatelessWidget {
  final List<MovieData> hindiMovies = [
    MovieData(title: 'Jawan', image: 'images/inggris/blue.jpeg'),
    MovieData(title: 'Jailer', image: 'images/inggris/Guardians.jpeg'),
    MovieData(title: 'Mission Raniganj', image: 'images/inggris/hunting.jpeg'),
    MovieData(title: 'Akelli', image: 'images/inggris/john.jpeg'),
    MovieData(title: '1920', image: 'images/inggris/mission.jpeg'),
    MovieData(title: 'Coat', image: 'images/inggris/OIP.jpeg'),
    MovieData(title: 'Coat', image: 'images/inggris/open.jpeg'),
    MovieData(title: 'Coat', image: 'images/inggris/perky.jpeg'),
    MovieData(title: 'Coat', image: 'images/inggris/quamtania.jpeg'),
    MovieData(title: 'Coat', image: 'images/inggris/spiderman.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1B2C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Choose Movie',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                suffixIcon: Icon(Icons.mic, color: Colors.white),
                filled: true,
                fillColor: Colors.black26,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Language Buttons
         SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      ...['Hindi', 'English', 'Marathi', 'Indonesia', 'Horor'].map((lang) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ElevatedButton(
            onPressed: () {
              if (lang == 'Hindi') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HindiMoviesPage()),
                );
              } else if (lang == 'English') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnglishMoviesPage()),
                );
              } else if (lang == 'Marathi') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => marathiMoviesPage()),
                );
              } else if (lang == 'Indonesia') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => indonesiaMoviesPage()),
                );
              } else if (lang == 'Horor') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => hororMoviesPage()),
                );
              }
              // Tambahkan navigasi lain untuk bahasa lainnya.
            },
            child: Text(lang),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: lang == 'English' ? Colors.pink : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        );
      }).toList(),
    ],
  ),
),

          // Movies Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: hindiMovies.length,
              itemBuilder: (context, index) {
                final movie = hindiMovies[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(movie.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Color(0xFF00C9FF), // Light blue
        unselectedItemColor: const Color.fromARGB(137, 12, 12, 12),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

class MovieData {
  final String title;
  final String image;

  MovieData({required this.title, required this.image});
}
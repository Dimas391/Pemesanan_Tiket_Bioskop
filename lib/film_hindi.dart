import 'package:flutter/material.dart';
import 'film_english.dart';
import 'film_marathi.dart';
import 'film_indonesia.dart';
import 'film_horor.dart';
import 'home.dart';
import 'pemesanan_makanan.dart';

class HindiMoviesPage extends StatefulWidget {
  @override
  _HindiMoviesPageState createState() => _HindiMoviesPageState();
}

class _HindiMoviesPageState extends State<HindiMoviesPage> {
  int _selectedIndex = 0;

  final List<MovieData> hindiMovies = [
    MovieData(title: 'Jawan', image: 'images/jawan.png'),
    MovieData(title: 'Jailer', image: 'images/jailer.jpeg'),
    MovieData(title: 'Mission Raniganj', image: 'images/akeli.jpg'),
    MovieData(title: 'Akelli', image: 'images/coat.jpeg'),
    MovieData(title: '1920', image: 'images/fukrey.png'),
    MovieData(title: 'Coat', image: 'images/horor.png'),
    MovieData(title: 'Coat', image: 'images/kushi.png'),
    MovieData(title: 'Coat', image: 'images/mumbaikar.jpg'),
    MovieData(title: 'Coat', image: 'images/omg.jpg'),
    MovieData(title: 'Coat', image: 'images/rassion.jpeg'),
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
                          // Stay on the current page
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
                      },
                      child: Text(lang),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: lang == 'Hindi' ? Colors.pink : Colors.grey,
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
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Location'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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

import 'package:flutter/material.dart';
import 'package:tiket_app/film_english.dart';
import 'package:tiket_app/film_hindi.dart';
import 'film_english.dart' as English;
import 'film_hindi.dart' as Hindi;
import 'film_horor.dart';
import 'film_indonesia.dart';
import 'film_marathi.dart';
import 'pemesanan_makanan.dart';


class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieApp(),
    );
  }
}

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final List<String> languages = ['Hindi', 'English', 'Marathi', 'Indonesia', 'Horor'];
  final List<English.MovieData> hindiMovies = [
    English.MovieData(
      title: 'Doctor Strange',
      image: 'images/doctor.jpg',
    ),
    English.MovieData(
      title: 'Blue Beetle',
      image: 'images/jailer.jpeg',
    ),
    English.MovieData(
      title: 'Jawan',
      image: 'images/jawan.png',
    ),
  ];
  final List<String> genres = ['Drama', 'Thriller', 'Action', 'Comedy', 'Crime'];
  final List<Hindi.MovieData> dramaMovies = [
    Hindi.MovieData(
      title: 'Aquaman',
      image: 'images/aquaman.png',
    ),
    Hindi.MovieData(
      title: 'Lightyear',
      image: 'images/disney.jpeg',
    ),
    Hindi.MovieData(
      title: 'Lightyear',
      image: 'images/superhero.jpg',
    ),
  ];

    final List<Widget> _pages = [
    HindiMoviesPage(),
    indonesiaMoviesPage(),
    // SearchScreen(),
    // CalendarScreen(),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Choose Movie',
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF121212), // Very dark gray (almost black)
              Color(0xFF1E1E1E), // Slightly lighter dark gray
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white54),
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                    suffixIcon: Icon(Icons.mic, color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[900]?.withOpacity(0.6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // Languages Row with Buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: languages
                      .map((language) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 141, 139, 139)?.withOpacity(0.6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                if (language == 'Hindi') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HindiMoviesPage(),
                                    ),
                                  );
                                }
                                
                                if (language == 'English') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EnglishMoviesPage(),
                                    ),
                                  );
                                }

                                if (language == 'Marathi') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => marathiMoviesPage(),
                                    ),
                                  );
                                }
                                 if (language == 'Indonesia') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => indonesiaMoviesPage(),
                                    ),
                                  );
                                }
                                 if (language == 'Horor') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => hororMoviesPage(),
                                    ),
                                  );
                                }

                                // Anda bisa menambahkan kondisi untuk bahasa lain seperti English, dll.
                              },
                              child: Text(
                                language,
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),

              // Hindi Movies
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(8),
                  itemCount: hindiMovies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(hindiMovies[index].image),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87,
                              blurRadius: 15,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Genres Row
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: genres
                        .map((genre) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Chip(
                                label: Text(
                                  genre,
                                  style: TextStyle(color: Colors.white70),
                                ),
                                backgroundColor: Colors.grey[900]?.withOpacity(0.6),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),

              // Drama Movies
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(8),
                  itemCount: dramaMovies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(dramaMovies[index].image),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87,
                              blurRadius: 15,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
      ),
    );
  }
}
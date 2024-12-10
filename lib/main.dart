import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema Seat Booking',
      theme: ThemeData.dark(),
      home: const SeatSelectionScreen(),
    );
  }
}

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({Key? key}) : super(key: key);

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  int _selectedIndex = 0;

  final List<List<String?>> leftSection = [
    ['available', 'available'],
    ['available', 'reserved', 'reserved', 'available'],
    ['available', 'available', 'reserved', 'available'],
    ['available', 'available', 'available', 'available'],
    ['reserved', 'available', 'available', 'reserved'],
    ['available', 'available', 'available', 'available'],
    ['available', 'reserved', 'reserved', 'available'],
    ['available', 'available', 'reserved', 'available'],
    ['available', 'available', 'available', 'available'],
  ];

  final List<List<String?>> rightSection = [
    ['available', 'available'],
    ['available', 'available', 'reserved', 'available'],
    ['available', 'reserved', 'reserved', 'available'],
    ['available', 'available', 'available', 'available'],
    ['reserved', 'available', 'available', 'reserved'],
    ['available', 'available', 'available', 'available'],
    ['available', 'reserved', 'reserved', 'available'],
    ['available', 'available', 'reserved', 'available'],
    ['available', 'available', 'available', 'available'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Seats'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 42, 1, 34),
              Color.fromARGB(255, 52, 4, 31),
              Color.fromARGB(255, 3, 70, 17),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Select your seats',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: List.generate(leftSection.length, (rowIndex) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSeatRow(leftSection[rowIndex]),
                      const SizedBox(width: 20), // Gang di tengah
                      _buildSeatRow(rightSection[rowIndex]),
                    ],
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  final selectedSeats = <String>[];
                  for (int row = 0; row < leftSection.length; row++) {
                    for (int col = 0; col < leftSection[row].length; col++) {
                      if (leftSection[row][col] == 'selected') {
                        selectedSeats.add('Left Row ${row + 1}, Seat ${col + 1}');
                      }
                    }
                  }
                  for (int row = 0; row < rightSection.length; row++) {
                    for (int col = 0; col < rightSection[row].length; col++) {
                      if (rightSection[row][col] == 'selected') {
                        selectedSeats.add('Right Row ${row + 1}, Seat ${col + 1}');
                      }
                    }
                  }
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Selected Seats'),
                      content: Text(
                        selectedSeats.isEmpty
                            ? 'No seats selected'
                            : selectedSeats.join(', '),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Confirm Selection'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Set background color to white
        elevation: 0,
        selectedItemColor: const Color(0xFF00C9FF),
        unselectedItemColor: const Color.fromARGB(136, 81, 76, 76),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (_selectedIndex == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else if (_selectedIndex == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MarathiMoviesPage()),
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Location'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildSeatRow(List<String?> row) {
    return Row(
      children: List.generate(row.length, (colIndex) {
        final seat = row[colIndex];
        final color = seat == 'available'
            ? Colors.white
            : seat == 'reserved'
                ? Colors.pink
                : Colors.green;
        return GestureDetector(
          onTap: () {
            setState(() {
              if (seat == 'available') {
                row[colIndex] = 'selected';
              } else if (seat == 'selected') {
                row[colIndex] = 'available';
              }
            });
          },
          child: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(
                Icons.chair,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: const Center(child: Text('Welcome to the Home Page')),
    );
  }
}

class MarathiMoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Marathi Movies')),
      body: const Center(child: Text('Welcome to Marathi Movies Page')),
    );
  }
}

class SnackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snacks')),
      body: const Center(child: Text('Welcome to Snack Page')),
    );
  }
}

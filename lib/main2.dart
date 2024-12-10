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
  final int rows = 7; // Jumlah baris kursi
  final int columns = 8; // Jumlah kolom kursi

  // Layout kursi (reserved = sudah dipesan, available = tersedia)
  List<List<String>> seatStatus = List.generate(
    7,
    (row) => List.generate(8, (col) => 'available'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Seats'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Select your seats',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: rows * columns,
                itemBuilder: (context, index) {
                  final row = index ~/ columns;
                  final col = index % columns;

                  String status = seatStatus[row][col];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (status == 'available') {
                          seatStatus[row][col] = 'selected';
                        } else if (status == 'selected') {
                          seatStatus[row][col] = 'available';
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'images/sofa2.png',
                        color: status == 'available'
                            ? Colors.white
                            : status == 'selected'
                                ? Colors.green
                                : Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                final selectedSeats = <String>[];
                for (int row = 0; row < rows; row++) {
                  for (int col = 0; col < columns; col++) {
                    if (seatStatus[row][col] == 'selected') {
                      selectedSeats.add('Row ${row + 1}, Seat ${col + 1}');
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
    );
  }
}

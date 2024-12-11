import 'package:flutter/material.dart';
import 'payment_page.dart'; // Pastikan file payment_page.dart berada dalam direktori yang sesuai.

class BookingSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'BOOKING SUMMARY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              bookingItem('CLASSIC - 3rd Row, Seat 15, 16', 'Rs 800.00'),
              Divider(color: Colors.white54),
              bookingItem('Convenience Fee', 'Rs 115.64'),
              Divider(color: Colors.white54),
              subTotalItem('Sub Total', 'Rs 915.64'),
              SizedBox(height: 20),
              Text(
                'Food & Beverages',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              foodItem('Nachos With Cheese & Salsa 90g (Qt: 1)', 'Rs 399.00'),
              foodItem('Strawberry & Mint Mocktail 450ml (Qt: 1)', 'Rs 339.15'),
              foodItem('Regular Caramel Popcorn 90g (Qt: 1)', 'Rs 438.90'),
              SizedBox(height: 20),
              subTotalItem('Amount Payable', 'Rs 2094.00'),
              Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9A0680),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Navigasi ke halaman PaymentPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentPagePage()),
                    );
                  },
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bookingItem(String title, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          Text(
            price,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget subTotalItem(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget foodItem(String name, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            price,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: BookingSummaryPage(),
      debugShowCheckedModeBanner: false,
    ));

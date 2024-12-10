import 'package:flutter/material.dart';
import 'booking_summary.dart'; // Pastikan nama file ini sesuai dengan nama file tempat kode halaman booking summary Anda.
import'payment_page.dart' ;
import 'Halaman_Pembayaran.dart';
import 'payment_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Summary',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: BookingSummaryPage(), // Mengarah ke halaman booking summary.
    );
  }
}

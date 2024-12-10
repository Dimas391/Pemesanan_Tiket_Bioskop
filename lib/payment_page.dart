import 'package:application/Halaman_Pembayaran.dart';
import 'package:flutter/material.dart';

// Pastikan HalamanPembayaran diimpor
import 'Payment_Page.dart'; // Sesuaikan path file Anda

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF9A0680),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amount Payable :',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rs: 2094',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Other Payment options',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Pilihan pembayaran
            paymentOptionItem(context, 'Debit/Credit Card'),
            paymentOptionItem(context, 'Net Banking'),
            paymentOptionItem(context, 'Mobile Wallets'),
            paymentOptionItem(context, 'UPI'),
            paymentOptionItem(context, 'Gift Voucher'),
          ],
        ),
      ),
    );
  }

  // Widget untuk item pilihan pembayaran
  Widget paymentOptionItem(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman pembayaran untuk semua opsi
        if (title == 'Net Banking' ||
            title == 'Mobile Wallets' ||
            title == 'UPI' ||
            title == 'Gift Voucher' ||
            title == 'Debit/Credit Card') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentPage(),
            ),
          );
        } else {
          // Jika opsi tidak dikenali, tampilkan SnackBar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title Selected')),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(color: Colors.white54),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

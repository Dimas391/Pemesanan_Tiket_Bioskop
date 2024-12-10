import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menambahkan gambar pertama (burger)
            Image.asset(
              'assets/burger.png',  // Path gambar pertama
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
            // Menambahkan gambar kedua (pepsi)
            Image.asset(
              'assets/pepsi.png',  // Path gambar kedua
              height: 150,
              width: 150,
            ),
            Image.asset(
              'assets/senwitch.png',  // Path gambar ke tiga
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/ayam_goreng.png',  // Path gambar ke empat
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}



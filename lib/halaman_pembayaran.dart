import 'package:flutter/material.dart';
import 'package:application/payment_screen.dart';

class HalamanPembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Amount Payable section
            _buildAmountPayable(),
            const SizedBox(height: 20),
            const Text(
              'Enter your card details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildCardDetailsForm(),
            const SizedBox(height: 20),
            // Event and seat details
            _buildEventDetails(),
            const Spacer(),
            // Buy button
            _buildBuyButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountPayable() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF9A0680), Color(0xFF1A1A2E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
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
    );
  }

  Widget _buildCardDetailsForm() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF5A5A5A),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          // Card number input field
          _buildTextField(
            label: 'Card Number',
            hint: 'Enter your card Number',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          // Name on the card input field
          _buildTextField(
            label: 'Name on the card',
            hint: 'Enter name on the card',
          ),
          const SizedBox(height: 10),
          // Expiration Date and CVV fields
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  label: 'MM',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField(
                  label: 'YY',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField(
                  label: 'CVV',
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEventDetails() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF9A0680), Color(0xFF1A1A2E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _EventDetailRow(
            icon: Icons.calendar_today,
            text: '2nd October 2023   19:00',
          ),
          SizedBox(height: 8),
          _EventDetailRow(
            icon: Icons.person,
            text: '2 person',
          ),
          SizedBox(height: 8),
          _EventDetailRow(
            icon: Icons.event_seat,
            text: '3rd Row, Seat 15,16',
          ),
          SizedBox(height: 8),
          _EventDetailRow(
            icon: Icons.attach_money,
            text: 'Total Amount ~ Rs 2094',
          ),
        ],
      ),
    );
  }

  Widget _buildBuyButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        backgroundColor: Colors.blueAccent,
        shape: const CircleBorder(),
      ),
      child: const Text(
        'BUY',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    String? hint,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}

class _EventDetailRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _EventDetailRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

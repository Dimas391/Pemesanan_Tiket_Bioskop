import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF3B176D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Hi!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildMenuItem(context, 'Your Orders', 'View and buy tickets or packages'),
                    _buildMenuItem(context, 'Stream Library', 'Browse & stream videos'),
                    _buildMenuItem(context, 'Pay Credit Card', 'Manage cards & payments'),
                    _buildMenuItem(context, 'Help Centre', 'Need help?'),
                    _buildMenuItem(context, 'Account & Settings', 'Profile settings & more', onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    }),
                    _buildMenuItem(context, 'Rewards', 'Earn and redeem rewards'),
                    _buildMenuItem(context, 'Offers', 'Latest deals'),
                    _buildMenuItem(context, 'Food & Beverages', 'Order snacks'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String subtitle, {VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Edit Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF000000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              SizedBox(height: 20),
              _buildProfileField('Mobile Number', 'Add Number'),
              _buildProfileField('Email Address', 'Add Email'),
              _buildProfileField('Personal Details', 'Add Details'),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Save Changes', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String title, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white)),
        SizedBox(height: 8),
        TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[800],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

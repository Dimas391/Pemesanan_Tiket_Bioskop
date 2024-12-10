import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Menjadikan LoginPage sebagai halaman utama
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF121212), // Warna latar belakang atas
              Color(0xFF1E1E1E), // Warna latar belakang bawah
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Judul atau logo aplikasi
                    Text(
                      'Movie App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
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
                    SizedBox(height: 40),

                    // TextField Email
                    TextFormField(
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.white70),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: Colors.grey[850],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    // TextField Password
                    TextFormField(
                      obscureText: _obscureText,
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.white70),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: Colors.grey[850],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    // Tombol Lupa Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => homepage(),
                        ),
                        );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Color(0xFF00C9FF)),
                        ),
                      ),
                    ),

                    // Tombol Login
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Placeholder untuk logika login
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Logging in...')),
                          );
                        }

                         Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => homepage(),
                        ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF00C9FF),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Divider untuk opsi login lain
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.white30,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'OR',
                            style: TextStyle(color: Colors.white54),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white30,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Tombol login sosial media
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton(
                          icon: Icons.facebook,
                          color: Colors.blue,
                          onPressed: () {
                            // Placeholder untuk login Facebook
                          },
                        ),
                        SizedBox(width: 20),
                        _buildSocialButton(
                          icon: Icons.email,
                          color: Colors.red,
                          onPressed: () {
                            // Placeholder untuk login Google
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Opsi untuk Sign Up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(color: Colors.white54),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigasi ke halaman Sign Up (Belum diimplementasi)
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xFF00C9FF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper untuk membuat tombol sosial media
  Widget _buildSocialButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }
}

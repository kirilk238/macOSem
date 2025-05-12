import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6FA), // Lavender background
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // White Circular Container for Logo and Image
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(150),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Logo
                      Image.asset(
                        'assets/diamond_logo.png', // Replace with your asset path
                        height: 100,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Moissanite Jewelry',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        'Accessible Luxury Jewelry',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      // Top Image
                      Image.asset(
                        'assets/ring_image.png', // Replace with your asset path
                        height: 100,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Email Input Field
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Input Field
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  onPressed: () {
                    // Handle login logic here
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),

                // Register Button
                TextButton(
                  onPressed: () {
                    // Navigate to Register page
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.deepPurple, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),

                // Social Media Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/instagram_icon.png',
                        height: 28,
                        width: 28,
                      ),
                      iconSize: 28,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        // Handle Instagram login
                      },
                    ),
                    const SizedBox(width: 24),
                    IconButton(
                      icon: Image.asset(
                        'assets/google_icon.png',
                        height: 28,
                        width: 28,
                      ),
                      iconSize: 28,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        // Handle Google login
                      },
                    ),
                    const SizedBox(width: 24),
                    IconButton(
                      icon: Image.asset(
                        'assets/facebook_icon.png',
                        height: 28,
                        width: 28,
                      ),
                      iconSize: 28,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        // Handle Facebook login
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

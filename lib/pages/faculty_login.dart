import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FacultyLoginPage extends StatefulWidget {
  @override
  _FacultyLoginPageState createState() => _FacultyLoginPageState();
}

class _FacultyLoginPageState extends State<FacultyLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _obscurePassword = true; // State to toggle password visibility

  Color primaryColor = Color(0xFF0056B3); // Deep Blue (Main Theme)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        elevation: 0, // Removes shadow under AppBar
      ),
      backgroundColor: Colors.blueGrey[50], // Light background color
      body: Column(
        children: [
          // App Logo (Placed right after the AppBar)
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: Image.asset('assets/sinhgadlogo.png', width: 220),
            ),
          ),

          SizedBox(height: 20), // Space after the logo

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Welcome Text
                    Text(
                      'Welcome, Faculty!',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[800],
                      ),
                    ),

                    SizedBox(height: 10),

                    // Form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Email Field
                          TextFormField(
                            controller: _emailController,
                            style: GoogleFonts.poppins(),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: GoogleFonts.poppins(),
                              prefixIcon: Icon(Icons.email, color: Colors.blueGrey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 15),

                          // Password Field with Visibility Toggle
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            style: GoogleFonts.poppins(),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: GoogleFonts.poppins(),
                              prefixIcon: Icon(Icons.lock, color: Colors.blueGrey),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.blueGrey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 10),

                          // Forgot Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Handle forgot password
                              },
                              child: Text(
                                'Forgot Password?',
                                style: GoogleFonts.poppins(color: Colors.blueGrey),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor, // Button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  // Perform login action
                                }
                              },
                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          // Register Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?", style: GoogleFonts.poppins()),
                              TextButton(
                                onPressed: () {
                                  // Navigate to Register Page
                                },
                                child: Text(
                                  'Register Now',
                                  style: GoogleFonts.poppins(color: Colors.blueGrey[700]),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

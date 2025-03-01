import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinhgad_fees_application/pages/forgot_pw_page.dart';

class StudentLoginPage extends StatefulWidget {
  @override
  _StudentLoginPageState createState() => _StudentLoginPageState();
}

class _StudentLoginPageState extends State<StudentLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true; // State to toggle password visibility
  Color primaryColor = Color(0xFF0056B3); // Deep Blue (Main Theme)
  
  // Dropdown selection state
  String? _selectedInstitute;
  final List<String> _institutes = ['LSIT', 'LHOS']; // Options

  // Sign in button action

  signIn() async{
    print("Email: ${_emailController.text}");
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
  }





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
                      'Welcome, Student!',
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

                          SizedBox(height: 15),

                          // Dropdown for LSIT or LHOS
                          DropdownButtonFormField<String>(
                            value: _selectedInstitute,
                            decoration: InputDecoration(
                              labelText: "Select Institute",
                              labelStyle: GoogleFonts.poppins(),
                              prefixIcon: Icon(Icons.account_balance, color: Colors.blueGrey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            items: _institutes.map((String institute) {
                              return DropdownMenuItem<String>(
                                value: institute,
                                child: Text(institute, style: GoogleFonts.poppins()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedInstitute = value;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select your institute';
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
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
                                  // print("Email: ${_emailController.text}");
                                  // print("Password: ${_passwordController.text}");
                                  // print("Institute: $_selectedInstitute");
                                  //Navigator.pushNamed(context, '/student_home');
                                  signIn();
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
                                  Navigator.pushNamed(context, '/onboarding');
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

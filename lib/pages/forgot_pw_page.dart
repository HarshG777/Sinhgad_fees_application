import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Import Lottie package

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false; // Controls Lottie animation visibility
  bool _isGifCompleted = false; // Ensures GIF plays only once and stays visible

  Future<void> _sendEmail() async {
    String email = _emailController.text.trim();

    // Validate email format
    if (email.isEmpty || !email.contains('@') || !email.contains('.')) {
      _showSnackBar('Please enter a valid email address', Colors.redAccent);
      return;
    }

    try {
      // Attempt to send a password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      // Show Lottie animation once
      setState(() {
        _isLoading = true;
      });

      // Simulate processing time (same as animation duration)
      await Future.delayed(Duration(seconds: 3));

      setState(() {
        _isLoading = false;
        _isGifCompleted = true; // Keep GIF visible
      });

      _showSnackBar('Password reset email sent to $email', Colors.green);
    } on FirebaseAuthException catch (e) {
      // If user not found, show error & don't start animation
      if (e.code == 'user-not-found') {
        _showSnackBar('No user found with this email', Colors.redAccent);
        return;
      }

      // For any other error, show message
      _showSnackBar('Error: ${e.message}', Colors.redAccent);
    }
  }

  // Helper function to show Snackbar
  void _showSnackBar(String message, Color bgColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: bgColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Color(0xFFF1F6F9),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Show Lottie animation ONCE and keep it visible after playing
                if (_isLoading || _isGifCompleted)
                  Lottie.asset(
                    'assets/lottie/mainSend.json',
                    width: 180,
                    height: 180,
                    fit: BoxFit.cover,
                    repeat: false, // Play only once
                  ),
                SizedBox(height: (_isLoading || _isGifCompleted) ? 20 : 0), // Adjust space dynamically

                // Title
                Text(
                  "Reset Your Password",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                SizedBox(height: 5),
                Text(
                  "Enter your registered email and we'll send you a reset link.",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),

                // Email Input Field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Registered Email ID',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.email, color: Color(0xFF0056B3)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF0056B3), width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF003366), width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),

                // Send Email Button
                InkWell(
                  onTap: _isLoading ? null : _sendEmail,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF0056B3), Color(0xFF003366)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Send Mail',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/Phone.json', width: 300),
              SizedBox(height: 50),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                  children: [
                    TextSpan(text: 'Your one-stop solution for managing college fees, receipts, and payment history! \n A smarter, more convenient way to handle your college finances—',
                      style: GoogleFonts.poppins(
                      color: Colors.black, 
                      ),
                    ),
                    TextSpan(
                      text: 'no matter what device you use!',
                      style: GoogleFonts.poppins(
                        color: Colors.blue[800], 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

        
            ],
          )
        ),
      ),
    );
  }
}
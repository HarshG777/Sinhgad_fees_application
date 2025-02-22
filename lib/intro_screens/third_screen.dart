import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ThirdScreen extends StatelessWidget {
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
              Lottie.asset('assets/lottie/payment.json', width: 380),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                  children: [
                    TextSpan(text: 'Say hello to stress-free payments - Multiple payment options for your convenience ',
                      style: GoogleFonts.poppins(
                      color: Colors.black, 
                      ),
                    ),
                    TextSpan(
                      text: 'choose what works best for you!',
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
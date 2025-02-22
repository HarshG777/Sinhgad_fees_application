import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class FourthScreen extends StatelessWidget {
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
              Lottie.asset('assets/lottie/Hello.json', width: 380),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                  children: [
                    TextSpan(text: "You're all set! Click ",
                      style: GoogleFonts.poppins(
                      color: Colors.black, 
                      ),
                    ),
                    TextSpan(
                      text: "'Done'",
                      style: GoogleFonts.poppins(
                        color: Colors.blue[800], 
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    TextSpan(text: " to get started.",
                      style: GoogleFonts.poppins(
                      color: Colors.black, 
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
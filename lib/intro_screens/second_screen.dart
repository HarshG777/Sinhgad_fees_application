import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
              Lottie.asset('assets/lottie/allData.json', width: 300),
              SizedBox(height: 50),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                  children: [
                    TextSpan(text: 'Get instant access to all your important college documents in one place!, No more searching—',
                      style: GoogleFonts.poppins(
                      color: Colors.black, 
                      ),
                    ),
                    TextSpan(
                      text: 'your syllabus, attendance, and timetables are just a tap away!',
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
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    const Color backgroundColor = Color(0xFFF4F4F4); // Light Grey
    const Color primaryColor = Color(0xFF0056B3); // Deep Blue (Main Theme)

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(                 //Main Container
          width: double.infinity,
          height: 600,
          padding: EdgeInsets.all(20),
          child: Column(                //Column inside the main container

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
              Image.asset('assets/sinhgadlogo.png', width: 270),

              SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, // Button color
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  minimumSize: Size(300, 50), // Button size
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/wrapper');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Fit content size
                  children: [
                    Image.asset('assets/student.png', width: 34, height: 34), // Image
                    SizedBox(width: 10), // Space between image and text
                    Text("Login AS Student", // Text
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, // Button color
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  minimumSize: Size(300, 50), // Button size
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/faculty_login');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Fit content size
                  children: [
                    Image.asset('assets/teacher.png', width: 34, height: 34), // Image
                    SizedBox(width: 10), // Space between image and text
                    Text("Login AS Faculty", // Text
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, // Button color
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  minimumSize: Size(300, 50), // Button size
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Fit content size
                  crossAxisAlignment: CrossAxisAlignment.center,
              
                  children: [
                    Image.asset('assets/onboarding.png', width: 34, height: 34), // Image
                    SizedBox(width: 10), // Space between image and text
                    Text("Onboard Member", // Text
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),


  
            ],
          ),
        ),
      ),
    );
  }
}
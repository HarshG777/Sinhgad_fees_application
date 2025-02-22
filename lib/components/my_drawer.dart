import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFF4F4F4); // Light Grey
    const Color primaryColor = Color(0xFF0056B3); // Deep Blue (Main Theme)
    return Drawer(
      backgroundColor: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          Container(
            padding: EdgeInsets.fromLTRB(16, 70, 0, 16),
            // margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[900]!, width: 1),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    // Square Image with Person Icon
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Background color
                        borderRadius: BorderRadius.circular(8), // Square shape
                      ),
                      child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
                    ),
                    SizedBox(width: 15),
                
                    // Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Gaikwad Harsh Vilas",
                          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        
                        // Course
                        Text(
                          "BE BACHELOR OF \nENGINEERING",
                          style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[700]),
                        ),
                        
                        SizedBox(height: 8),
                        
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Student UID & Institute Code
                Text(
                  "Student UID: 2223/LSIT/09050\nInstitute Code: LSIT",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // Drawer Menu Items
          ListTile(
            leading: Icon(Icons.description, color: primaryColor),
            title: Text("About Sinhgad Technical Education Society, Pune", style: GoogleFonts.poppins()),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.share, color: primaryColor),
            title: Text("Share App", style: GoogleFonts.poppins()),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.favorite, color: Colors.redAccent),
            title: Text("Rate Us", style: GoogleFonts.poppins()),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.logout, color: primaryColor),
            title: Text("Logout", style: GoogleFonts.poppins()),
            onTap: () {},
          ),

          Spacer(),

          // Version Text
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 10),
            child: Text(
              "Version 2.0",
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}

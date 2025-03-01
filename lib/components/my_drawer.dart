import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  String _imageUrl = "";
  String _username = "Unknown User";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load user data (including profile image and username)
  Future<void> _loadUserData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    
    if (userDoc.exists) {
      Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
      setState(() {
        _imageUrl = data.containsKey('profileImage') ? data['profileImage'] : "";
        _username = data.containsKey('name') ? data['name'] : "Unknown User";
      });
    }
  }

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
                      child: _imageUrl.isNotEmpty
                                ? Image.network(_imageUrl, fit: BoxFit.cover)
                                : const Icon(Icons.person, size: 70, color: Colors.grey),
                    ),
                    SizedBox(width: 15),
                
                    // Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _username,
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
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
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

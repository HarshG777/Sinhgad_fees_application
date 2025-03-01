import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinhgad_fees_application/components/my_drawer.dart';
import 'package:sinhgad_fees_application/pages/pending_fees.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  Color primaryColor = Color(0xFF0056B3);
  File? _imageFile;
  String _imageUrl = "";
  String _username = "";
  String _contactNo = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load user data (including profile image, username, and contact number)
  Future<void> _loadUserData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (userDoc.exists) {
      Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
      setState(() {

        _imageUrl = data.containsKey('profileImage') ? data['profileImage'] : "";
        _username = data.containsKey('name') ? data['name'] : "Unknown User";
        _contactNo = data.containsKey('contactNo') ? data['contactNo'] : "N/A";
      });
    }
  }

  // Pick Image from Gallery or Camera
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      await _uploadImage();
    }
  }

  // Upload Image to Firebase Storage
  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    String uid = FirebaseAuth.instance.currentUser!.uid;
    Reference storageRef = FirebaseStorage.instance.ref().child('profile_images/$uid.jpg');

    UploadTask uploadTask = storageRef.putFile(_imageFile!);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'profileImage': downloadUrl,
    });

    setState(() {
      _imageUrl = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6F9),
      appBar: AppBar(
        title: const Text('DASHBOARD'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                "SINHGAD INSTITUTE OF TECHNOLOGY",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Profile Pic and Information
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Column(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromARGB(255, 193, 194, 197),
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: _imageUrl.isNotEmpty
                                ? Image.network(_imageUrl, fit: BoxFit.cover)
                                : const Icon(Icons.person, size: 120, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _username,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text("2022-2025", style: TextStyle(fontSize: 16)),
                      Text(_contactNo, style: TextStyle(fontSize: 16)),
                      const Text("SIT, Lonavala", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                '${_username}/2222/LSIT/000001',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 60),

              // Buttons for Fees and Payment
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  minimumSize: Size(300, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: Image.asset('assets/sandTime.png', width: 24),
                label: Text(' Pending Fees', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => PendingFees()));
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  minimumSize: Size(300, 50),
                ),
                icon: Image.asset('assets/funds.png', width: 24),
                label: Text(' Additional Fees', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                onPressed: () {},
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  minimumSize: Size(300, 50),
                ),
                icon: Image.asset('assets/history.png', width: 24),
                label: Text(' Payment History', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sinhgad_fees_application/components/my_drawer.dart';
// import 'package:sinhgad_fees_application/pages/pending_fees.dart';
// import 'package:provider/provider.dart';
// import 'package:sinhgad_fees_application/services/user_data_provider.dart';

// class StudentHome extends StatefulWidget {
//   const StudentHome({super.key});

//   @override
//   State<StudentHome> createState() => _StudentHomeState();
// }

// class _StudentHomeState extends State<StudentHome> {
//   Color primaryColor = Color(0xFF0056B3);
//   File? _imageFile;

//   // Pick Image from Gallery or Camera
//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//       await _uploadImage();
//     }
//   }

//   // Upload Image to Firebase Storage
//   Future<void> _uploadImage() async {
//     if (_imageFile == null) return;

//     final userData = Provider.of<UserDataProvider>(context, listen: false);
//     await userData.uploadProfileImage(_imageFile!);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final userData = Provider.of<UserDataProvider>(context);
    
//     return Scaffold(
//       backgroundColor: const Color(0xFFF1F6F9),
//       appBar: AppBar(
//         title: const Text('DASHBOARD'),
//         backgroundColor: primaryColor,
//         foregroundColor: Colors.white,
//       ),
//       drawer: MyDrawer(),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           child: Column(
//             children: [
//               const SizedBox(height: 30),
//               const Text(
//                 "SINHGAD INSTITUTE OF TECHNOLOGY",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 30),

//               // Profile Pic and Information
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: _pickImage,
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 130,
//                           width: 130,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(
//                               color: const Color.fromARGB(255, 193, 194, 197),
//                               width: 2,
//                             ),
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: userData.imageUrl.isNotEmpty
//                                 ? Image.network(userData.imageUrl, fit: BoxFit.cover)
//                                 : const Icon(Icons.person, size: 120, color: Colors.grey),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 25),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         userData.username,
//                         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       const Text("2022-2025", style: TextStyle(fontSize: 16)),
//                       Text(userData.contactNo, style: TextStyle(fontSize: 16)),
//                       const Text("SIT, Lonavala", style: TextStyle(fontSize: 16)),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 30),
//               Text(
//                 '${userData.username}/2222/LSIT/000001',
//                 style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//               ),
//               const SizedBox(height: 60),

//               // Buttons for Fees and Payment
//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: primaryColor,
//                   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   minimumSize: Size(300, 50),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 ),
//                 icon: Image.asset('assets/sandTime.png', width: 24),
//                 label: Text(' Pending Fees', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
//                 onPressed: () {
//                    Navigator.push(context, MaterialPageRoute(builder: (context) => PendingFees()));
//                 },
//               ),

//               const SizedBox(height: 20),

//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: primaryColor,
//                   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   minimumSize: Size(300, 50),
//                 ),
//                 icon: Image.asset('assets/funds.png', width: 24),
//                 label: Text(' Additional Fees', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
//                 onPressed: () {},
//               ),

//               const SizedBox(height: 20),

//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: primaryColor,
//                   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   minimumSize: Size(300, 50),
//                 ),
//                 icon: Image.asset('assets/history.png', width: 24),
//                 label: Text(' Payment History', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

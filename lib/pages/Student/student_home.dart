import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinhgad_fees_application/components/my_drawer.dart';
import 'package:sinhgad_fees_application/pages/pending_fees.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  Color primaryColor = Color(0xFF0056B3); // Deep Blue (Main Theme)
  // File? _imageFile;

  // //pick image
  // Future pickImage() async {
  //   final ImagePicker picker = ImagePicker();

  //   //pick from gallery
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  //   //upload image preview
  //   if (image != null) {
  //     setState(() {
  //       _imageFile = File(image.path);
  //     });
  //   }
  // }

  //upload
  // Future uploadImage() async {
  //   if (_imageFile == null) return;
  //   //generate file name
  //   final fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   final path = 'uploads/$fileName';

  //   await Supabase.instance.client.storage
  //       .from('images')
  //       .upload(path, _imageFile!)
  //       .then((value) => ScaffoldMessenger.of(context).showSnackBar(
  //             const SnackBar(
  //               content: Text('Image uploaded successfully'),
  //             ),
  //           ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6F9),
      appBar: AppBar(
        title: const Text('DASHBOARD'),
        centerTitle: false,
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
              //sinhgad students text
              const Text(
                "SINHGAD INSTITUTE OF TECHNOLOGY",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              //Profile pic and name etc information
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Profile pic
                  GestureDetector(
                    // onTap: () {
                    //   pickImage();
                    //   uploadImage();
                    // },
                    child: Column(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F6F9),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromARGB(255, 193, 194, 197),
                              width: 2,
                            ),

                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: //_imageFile != null
                                // ? Image.file(
                                //     _imageFile!,
                                //     fit: BoxFit.cover,
                                //   ) :
                                  const Center(
                                    child: Icon(
                                      Icons.person,
                                      size: 120,
                                      color: Colors.grey,
                                    ),
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ANUJ SHARMA",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "2022-2025",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "7887985748",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "SIT, Lonavala",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Sharma Anuj Suresh/2222/LSIT/000001',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 60),
              // Pending Fees Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, // Button color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  minimumSize: Size(300, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: Image.asset('assets/sandTime.png', width: 24), // Icon
                label: Text(' Pending Fees', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => PendingFees()));
                },
              ),

              const SizedBox(height: 20), // Spacing

              // Additional Fees Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  minimumSize: Size(300, 50),
                ),
                icon: Image.asset('assets/funds.png', width: 24),
                label: Text(' Additional Fees', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                onPressed: () {
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => AdditionalFees()));
                },
              ),

              const SizedBox(height: 20), // Spacing

              // Payment History Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  minimumSize: Size(300, 50),
                  ),
                icon: Image.asset('assets/history.png', width: 24),
                label: Text(' Payment History', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentHistory()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
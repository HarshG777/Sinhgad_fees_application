import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingFees extends StatefulWidget {
  @override
  _PendingFeesState createState() => _PendingFeesState();
}

class _PendingFeesState extends State<PendingFees> {
  final TextEditingController _feesController = TextEditingController();
  final int totalFees = 20000; // Total Fees Amount

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFF0056B3); // Deep Blue
    const Color backgroundColor = Color(0xFFF4F4F4); // Light Grey

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Pending Fees", style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("*Note: Exam Backlog Fees, Fines, Late Fees are to be paid from 'Additional Fees Payment' option",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
            SizedBox(height: 20),

            // Remaining Fees Highlighted
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.red, width: 1),
              ),
              child: Text(
                "Remaining Fees: ₹$totalFees",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red[800]),
              ),
            ),
            SizedBox(height: 20),

            // Fees Paid Initially (Editable Input)
            Text("Fees Paid Initially", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green, width: 1),
              ),
              child: TextField(
                controller: _feesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Amount",
                  border: InputBorder.none,
                ),
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[900]),
              ),
            ),
            SizedBox(height: 10),

            // Total Fees Section
            Text("Total Fees", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue, width: 1),
              ),
              child: Text(
                "₹$totalFees",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[800]),
              ),
            ),
            SizedBox(height: 30),

            // Pay Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add payment functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("Pay", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            SizedBox(height: 15),

            // Pay Full Amount (Clickable Text)
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _feesController.text = totalFees.toString(); // Auto-fill input field
                  });
                },
                child: Text(
                  "Pay Full Amount",
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo, decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

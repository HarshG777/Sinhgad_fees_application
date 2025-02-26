import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getUserData() async {
    User? user = _auth.currentUser;
    if (user == null) return null; // No logged-in user

    DocumentSnapshot snapshot = await _firestore.collection('user').doc(user.uid).get();
    if (snapshot.exists) {
      return snapshot.data() as Map<String, dynamic>?;
    }
    return null;
  }
}

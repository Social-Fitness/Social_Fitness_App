
import 'package:cloud_firestore/cloud_firestore.dart';

class Controll_Services {
  getLatestReview(String email, String password) {
    return Firestore.instance
        .collection("users")
        .where("Email", isEqualTo: email)
        .where("Password", isEqualTo: password)
        .getDocuments();
  }
}
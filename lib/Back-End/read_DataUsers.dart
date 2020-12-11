import 'package:cloud_firestore/cloud_firestore.dart';

class Read_Data_Services {
  getDataUsers(String email) { //Da modificare con l'id
    return Firestore.instance
        .collection("users")
        .where("Email", isEqualTo: email)
        .getDocuments();
  }
}
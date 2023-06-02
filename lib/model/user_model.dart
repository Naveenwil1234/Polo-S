import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? phone;
  String? name;
  String? id;
  String? email;
  String? address;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.id,
  });

  UserModel.fromSnapshot(DataSnapshot snap) {
    phone = (snap.value as dynamic)["phone"];
    name = (snap.value as dynamic)["phone"];
    email = (snap.value as dynamic)["phone"];
    id = snap.key;
    address = (snap.value as dynamic)["phone"];
  }
}

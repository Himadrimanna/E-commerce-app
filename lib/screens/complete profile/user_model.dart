import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final String phoneno;
  final String password;

  UserModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.phoneno,
    required this.password,
  });

  toJson() {
    return {
      "UID": id,
      "Fullname": fullname,
      "Email": email,
      "Password": password,
      "Phone no": phoneno,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: data["UID"],
        fullname: data["Fullname"],
        email: data["Email"],
        phoneno: data['Phone no'],
        password: data['Password']);
  }
}

class UserModel2 {
  final String address1;
  final String address2;
  final String city;
  final String zipcode;
  final String state;
  final String country;

  UserModel2({
    required this.address1,
    required this.address2,
    required this.city,
    required this.zipcode,
    required this.state,
    required this.country,
  });

  toJson1() {
    return {
      "Address": '$address1 '
          ' $address2 '
          ' $city '
          ' $zipcode '
          ' $state '
          ' $country'
    };
  }

  factory UserModel2.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel2(
        address2: '',
        address1: data["Address"],
        city: '',
        country: '',
        state: '',
        zipcode: '');
  }
}

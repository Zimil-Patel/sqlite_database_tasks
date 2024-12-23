import 'dart:typed_data';

class UserModel {
  final String firstName, lastName, email, password, phoneNumber;
  Uint8List? profilePicture;
  String? age;
  String? gender;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    this.age,
    this.gender,
    this.profilePicture,
  });

  factory UserModel.fromDb(Map map) => UserModel(
        firstName: map['firstName'] ?? "Not set",
        lastName: map['lastName'] ?? "Not set",
        email: map['email'] ?? "Not set",
        password: map['password'] ?? "Not set",
        phoneNumber: map['phoneNumber'] ?? "Not set",
        age: map['age'],
        gender: map['gender'],
        profilePicture: map['profilePicture'],
      );
}

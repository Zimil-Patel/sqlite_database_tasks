import 'dart:typed_data';

class UserModel {
  final int id;
  final String firstName, lastName, email, password, phoneNumber;
  Uint8List? profilePicture;
  int? age;
  String? gender;

  UserModel({
    required this.id,
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
        id: map['id'] ?? 0,
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

import 'dart:typed_data';

class UserModel {
  final String firstName, lastName, email, password, phoneNumber;
  Uint8List? profilePicture;
  int? age;
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
        firstName: map['firstName'],
        lastName: map['lastName'],
        email: map['email'],
        password: map['password'],
        phoneNumber: map['phoneNumber'],
        age: map['age'],
        gender: map['gender'],
        profilePicture: map['profilePicture'],
      );
}

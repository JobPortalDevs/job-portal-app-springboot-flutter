import 'dart:ffi';

import 'package:jobportal_app/features/models/user_profile_model.dart';

class Employee {
  String id;
  String name;
  String address;
  String gender;
  String qualification;
  Int workExperience;
  String email;
  UserProfile userProfile;

  Employee(
      {required this.id,
      required this.name,
      required this.address,
      required this.gender,
      required this.qualification,
      required this.workExperience,
      required this.email,
      required this.userProfile});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        userProfile: UserProfile.fromJson(json["userProfile"]),
        address: json["address"],
        gender: json["gender"],
        qualification: json["qualification"],
        workExperience: json["workExperience"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "gender": gender,
      "address": address,
      "qualification": qualification,
      "workExperience": workExperience.toString(),
      "userProfile": userProfile.toJson()
    };
  }
}

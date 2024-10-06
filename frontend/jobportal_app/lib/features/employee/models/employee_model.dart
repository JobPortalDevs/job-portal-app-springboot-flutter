import 'package:jobportal_app/features/user_profile/models/user_profile_model.dart';

class Employee {
  String id;
  String name;
  String email;
  UserProfile userProfile;

  Employee(
      {required this.id,
      required this.name,
      required this.email,
      required this.userProfile});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        userProfile: UserProfile.fromJson(json["userProfile"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "userProfile": userProfile.toJson()
    };
  }
}

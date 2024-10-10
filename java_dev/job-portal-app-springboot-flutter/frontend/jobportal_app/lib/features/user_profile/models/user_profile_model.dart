class UserProfile {
  int? id;
  String name;
  String email;
  String? resume;
  String role;

  UserProfile(
      {required this.id,
      required this.name,
      required this.email,
      this.resume,
      required this.role});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "role": role};
  }
}

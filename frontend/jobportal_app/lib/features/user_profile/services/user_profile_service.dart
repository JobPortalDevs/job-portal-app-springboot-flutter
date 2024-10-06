import 'dart:convert';

import 'package:jobportal_app/constants/apis/urls.dart';
import "package:http/http.dart" as http;
import 'package:jobportal_app/features/user_profile/models/user_profile_model.dart';

class UserProfileService {
  final String userProfileBaseUrl = "$baseUrl/api/user-profiles";

  Future<List<UserProfile>> getAllUserProfiles() async {
    final response = await http.get(Uri.parse(userProfileBaseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => UserProfile.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load user profiles");
    }
  }

  Future<UserProfile> createUserProfile(UserProfile profile) async {
    final response = await http.post(
      Uri.parse(userProfileBaseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(profile.toJson()),
    );

    if (response.statusCode == 200) {
      return UserProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create user profile");
    }
  }
}

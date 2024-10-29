import 'dart:convert';
import 'package:jobportal_app/constants/apis/urls.dart';
import "package:http/http.dart" as http;
import 'package:jobportal_app/core/utils/api_response.dart';
import 'package:jobportal_app/features/user_profile/models/user_profile_model.dart';

class UserProfileService {
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

  Future<UserProfile> updateUserProfile(UserProfile profile) async {
    final response = await http.put(
      Uri.parse("$userProfileBaseUrl/${profile.id}/update"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(profile.toJson()),
    );
    if (response.statusCode == 200) {
      print("Updating profile with id: ${profile.id}");
      return UserProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update user profile");
    }
  }

  Future<ApiResponse> deleteUserProfile(UserProfile profile) async {
    final response = await http.delete(
      Uri.parse('$userProfileBaseUrl/${profile.id}/delete'),
      headers: {"Content-Type": "application/json"},
    );
    print('Deleting user profile at: $userProfileBaseUrl/${profile.id}/delete');
    if (response.statusCode == 204) {
      return ApiResponse(
        success: true,
        data: null,
        message: 'User profile deleted successfully',
      );
    } else {
      return ApiResponse(
        success: false,
        data: null,
        message:
            'Failed to delete user profile. Status code: ${response.statusCode}',
      );
    }
  }
}

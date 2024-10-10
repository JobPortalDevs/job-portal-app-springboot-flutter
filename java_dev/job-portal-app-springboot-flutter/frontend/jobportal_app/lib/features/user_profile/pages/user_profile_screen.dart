import 'package:flutter/material.dart';
import 'package:jobportal_app/core/utils/api_response.dart';
import 'package:jobportal_app/features/user_profile/models/user_profile_model.dart';
import 'package:jobportal_app/features/user_profile/pages/add_edit_user_profile_screen.dart';
import '../services/user_profile_service.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final UserProfileService _userProfileService = UserProfileService();
  List<UserProfile> _userProfiles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserProfiles();
  }

  Future<void> _fetchUserProfiles() async {
    final profiles = await _userProfileService.getAllUserProfiles();
    setState(() {
      _userProfiles = profiles;
      _loading = false;
    });
  }

  void _deleteProfile(UserProfile userProfile) async {
    bool? confirmDelete = await _showDeleteConfirmationDialog();
    if (confirmDelete != true) return;

    setState(() => _loading = true);
    try {
      ApiResponse response =
          await _userProfileService.deleteUserProfile(userProfile);
      if (response.success) {
        await _fetchUserProfiles();
        _showSnackBar('User profile deleted successfully!');
      } else {
        _showSnackBar('Failed to delete user profile: ${response.message}');
      }
    } catch (e) {
      _showSnackBar('An error occurred while deleting the profile: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  void _navigateToAddProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserProfileForm()),
    );
    if (result == true) {
      _fetchUserProfiles();
    }
  }

  void _navigateToEditProfile(UserProfile profile) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UserProfileForm(userProfile: profile)),
    );
    if (result == true) {
      _fetchUserProfiles();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Profiles")),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _userProfiles.length,
              itemBuilder: (context, index) {
                final profile = _userProfiles[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(profile.name),
                    subtitle:
                        Text("Email: ${profile.email} | Role: ${profile.role}"),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _navigateToEditProfile(profile),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteProfile(profile),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddProfile,
        child: Icon(Icons.add),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<bool?> _showDeleteConfirmationDialog() async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Profile'),
          content: Text('Are you sure you want to delete this profile?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
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

  void _navigateToAddProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              UserProfileForm()), // Navigate to Add User Profile
    );
    if (result == true) {
      _fetchUserProfiles(); // Refresh the list after adding new profile
    }
  }

  void _navigateToEditProfile(UserProfile profile) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UserProfileForm(
              userProfile: profile)), // Navigate to Edit User Profile
    );
    if (result == true) {
      _fetchUserProfiles(); // Refresh the list after editing the profile
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
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _navigateToEditProfile(
                          profile), // Edit button on each card
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddProfile, // Add Profile Button
        child: Icon(Icons.add),
      ),
    );
  }
}

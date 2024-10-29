import 'package:flutter/material.dart';
import 'package:jobportal_app/features/models/user_profile_model.dart';
import 'package:jobportal_app/features/services/user_profile_service.dart';

class UserProfileForm extends StatefulWidget {
  final UserProfile? userProfile; // Null for adding new, non-null for editing

  const UserProfileForm({super.key, this.userProfile});

  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final UserProfileService _userProfileService = UserProfileService();

  // Text controllers for the fields
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController resumeController;
  String role = "USER"; // Default role value

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing values (if editing)
    nameController =
        TextEditingController(text: widget.userProfile?.name ?? "");
    emailController =
        TextEditingController(text: widget.userProfile?.email ?? "");
    resumeController =
        TextEditingController(text: widget.userProfile?.resume ?? "");
    role = widget.userProfile?.role ?? "USER";
  }

  @override
  void dispose() {
    // Dispose controllers when the form is disposed
    nameController.dispose();
    emailController.dispose();
    resumeController.dispose();
    super.dispose();
  }

  void _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      UserProfile profile = UserProfile(
        id: widget.userProfile?.id, // Keep ID if editing
        name: nameController.text,
        email: emailController.text,
        resume: role == "USER" ? resumeController.text : null,
        role: role,
      );

      try {
        if (widget.userProfile == null) {
          await _userProfileService
              .createUserProfile(profile); // Create new profile
        } else {
          print("Update expected");
          print("Resume url: ${resumeController.text}");
          await _userProfileService
              .updateUserProfile(profile); // Edit existing profile
          // print("P L A C E  H O L D E R  P R I N T !");
        }
        Navigator.pop(
            context, true); // Return to previous screen with success status
      } catch (e) {
        // Show error if save operation fails
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to save profile: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.userProfile == null
              ? "Add User Profile"
              : "Edit User Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter a name" : null,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter an email" : null,
              ),
              // TextFormField(
              //   controller: resumeController,
              //   decoration: InputDecoration(labelText: "Resume (Optional)"),
              // ),
              DropdownButtonFormField(
                value: role,
                items: ["USER", "EMPLOYER"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) => setState(() => role = value!),
                decoration: const InputDecoration(labelText: "Role"),
              ),
              if (role == "USER")
                TextFormField(
                  controller: resumeController,
                  decoration: const InputDecoration(labelText: "Resume URL"),
                  validator: (value) => role == "USER" && value!.isEmpty
                      ? "Please enter a resume URL"
                      : null,
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text(widget.userProfile == null ? "Create" : "Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

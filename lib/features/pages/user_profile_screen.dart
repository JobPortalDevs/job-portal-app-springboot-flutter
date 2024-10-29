import 'package:flutter/material.dart';
import 'package:jobportal_app/features/models/user_profile_model.dart';
import 'package:jobportal_app/features/pages/add_edit_user_profile_screen.dart';
import '../services/user_profile_service.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

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
              const UserProfileForm()), // Navigate to Add User Profile
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
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                // color: Colors.grey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    child: Image.asset("assetname"), //update asset name
                  ),
                  const SizedBox(height: 10,),
                  const Text("Username123", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                  const SizedBox(height: 10,),
                  const Text("emailaddress.example.com",style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black))
                ],
              ),
            ),
            Container(
              // height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
              height: 800,
              child: ListView(
                children: [
                  const ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text(
                      "address",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      "123 Magwegwe west",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const ListTile(
                    leading: Icon(Icons.man_4_outlined),
                    title: Text(
                      "Gender",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      "Male",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const ListTile(
                    leading: Icon(Icons.school),
                    title: Text(
                      "Qualification",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      "Masters in Accounting",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const ListTile(
                    leading: Icon(Icons.work_history),
                    title: Text(
                      "Work experience in years",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      "5 years",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const ListTile(
                    leading: Icon(Icons.work_history),
                    title: Text(
                      "Link to resume",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      "https://th.bing.com/th/id/R.85b660e4cfa28031b70cc70d2e7df008?rik=5sMAjG61%2frbz8g&pid=ImgRaw&r=0",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                
                  Container(
                    padding: const EdgeInsets.all(30),
                    color: Colors.white,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UserProfileForm()));
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            elevation: 10,
                            padding: const EdgeInsets.all(5)),
                        child: const Text("Edit")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(title: const Text("User Profiles")),
    //   body: _loading
    //       ? const Center(child: CircularProgressIndicator())
    //       : ListView.builder(
    //           itemCount: _userProfiles.length,
    //           itemBuilder: (context, index) {
    //             final profile = _userProfiles[index];
    //             return Card(
    //               margin:
    //                   const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    //               child: ListTile(
    //                 title: Text(profile.name),
    //                 subtitle:
    //                     Text("Email: ${profile.email} | Role: ${profile.role}"),
    //                 trailing: IconButton(
    //                   icon: const Icon(Icons.edit),
    //                   onPressed: () => _navigateToEditProfile(
    //                       profile), // Edit button on each card
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _navigateToAddProfile, // Add Profile Button
    //     child: const Icon(Icons.add),
    //   ),
    // );
  }
}

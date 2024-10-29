import 'package:flutter/material.dart';
import 'package:jobportal_app/features/models/employeeModel.dart';

class Applicantcard extends StatelessWidget {
 const Applicantcard({super.key, required this.applicant});

  final Employee applicant;

  @override
  Widget build(BuildContext context) {
  return   ListTile(
      title: Text(applicant.name),
      subtitle: Text("qualification $applicant['qualification']"),
        trailing: IconButton(
                        onPressed: () {
                          // _launchURL(url); // Open the URL when clicked
                          //view applicant profile
                        },
                        icon: const Icon(Icons.open_in_browser), // Icon to indicate the link
                      ),
    );
               
  }
}






      // ListTile(
      //                 leading: Text((index + 1).toString()), 
      //                 title: Text(url), // Display the URL
      //                 trailing: IconButton(
      //                   onPressed: () {
      //                     _launchURL(url); // Open the URL when clicked
      //                   },
      //                   icon: const Icon(Icons.open_in_browser), // Icon to indicate the link
      //                 ),
      //               );
    
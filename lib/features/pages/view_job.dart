import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobportal_app/features/models/employeeModel.dart';
import 'package:jobportal_app/features/models/jobModel.dart';
import 'package:jobportal_app/features/reusableComponoents/applicantCard.dart';
import 'package:url_launcher/url_launcher.dart';


final showApplicantsProvider = StateProvider<bool>((ref) => false);
final applicationUrlsProvider = StateProvider<List<Employee>>((ref) => []); // State for list of URLs

class ViewJob extends ConsumerStatefulWidget {
  const ViewJob({super.key, required this.job});
  final Job job;

  @override
  ConsumerState<ViewJob> createState() => _ViewJobState();
}


class _ViewJobState extends ConsumerState<ViewJob> {
  // Function to open a URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication); // Launch in external browser
    } else {
      throw 'Could not launch $url';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    bool showApplicants = ref.watch(showApplicantsProvider);
    List<Employee> applicationUrls = ref.watch(applicationUrlsProvider); // Fetch list of URLs

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                leading: const Text("title"),
                trailing: Text(widget.job.title), 
              ),
              ListTile(
                leading: const Text("location"),
                trailing: Text(widget.job.location), 
              ),
              ListTile(
                leading: const Text("applications"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(applicationUrls.length.toString()), 
                    IconButton(
                      onPressed: () {
                        ref.read(showApplicantsProvider.notifier).state =
                            !showApplicants;
                      },
                      icon: showApplicants
                          ? const Icon(
                              Icons.arrow_circle_up_sharp,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.arrow_circle_down_sharp,
                              color: Colors.green,
                            ),
                    ),
                  ],
                ),
              ),
              if (showApplicants)
                ListView.builder(
                  shrinkWrap: true, 
                  physics: const NeverScrollableScrollPhysics(), // Prevent nested scrolling
                  itemCount: applicationUrls.length,
                  itemBuilder: (context, index) {
                    return Applicantcard(applicant: applicationUrls[index]);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:jobportal_app/core/utils/api_response.dart';
import 'package:jobportal_app/features/job/models/job_application_model.dart';
import 'package:jobportal_app/features/job/models/job_model.dart';
import 'package:jobportal_app/features/job/pages/job_application_form.dart';
import 'package:jobportal_app/features/job/services/job_application_service.dart';
import 'package:jobportal_app/features/user_profile/models/user_profile_model.dart';

class JobApplicationList extends StatefulWidget {
  const JobApplicationList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JobApplicationListState createState() => _JobApplicationListState();
}

class _JobApplicationListState extends State<JobApplicationList> {
  final JobApplicationService _jobApplicationService = JobApplicationService();
  final UserProfile employer =
      UserProfile(id: null, name: "", email: "", role: "");
  final Job job = Job(
      id: 0,
      title: "",
      description: "",
      location: "",
      companyName: "",
      postedDate: DateTime.parse('2000-01-01 00:00:00Z'),
      applicationDeadline: DateTime.parse('2000-01-01 00:00:00Z'));
  List<JobApplication> _jobApplications = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchJobApplications();
  }

  Future<void> _fetchJobApplications() async {
    final jobApplications =
        await _jobApplicationService.getAllJobApplications();
    setState(() {
      _jobApplications = jobApplications;
      _loading = false;
    });
  }

  void _deleteJobApplication(JobApplication jobApplication) async {
    bool? confirmDelete = await _showDeleteConfirmationDialog();
    if (confirmDelete != true) return;

    setState(() => _loading = true);
    try {
      ApiResponse response =
          await _jobApplicationService.deleteJobApplication(jobApplication);
      if (response.success) {
        await _fetchJobApplications();
        _showSnackBar('Job application deleted successfully!');
      } else {
        _showSnackBar('Failed to delete job application: ${response.message}');
      }
    } catch (e) {
      _showSnackBar('An error occurred while deleting the job application: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  void _navigateToAddJobApplication() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => JobApplicationForm(
                job: job,
              )),
    );
    if (result == true) {
      _fetchJobApplications();
    }
  }

  void _navigateToEditJobApplication(JobApplication jobApplication) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              JobApplicationForm(jobApplication: jobApplication)),
    );
    if (result == true) {
      _fetchJobApplications();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Job Applications")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _jobApplications.length,
              itemBuilder: (context, index) {
                final jobApplication = _jobApplications[index];
                return InkWell(
                  onTap: () {
                    _showApplicationConfirmationDialog(jobApplication);
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(jobApplication.resumeLink),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _navigateToEditJobApplication(jobApplication),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteJobApplication(jobApplication),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
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
          title: const Text('Delete Job Application'),
          content: const Text(
              'Are you sure you want to delete this job application?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );
  }

  _showApplicationConfirmationDialog(JobApplication jobApplication) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Application status'),
          content: const Text(
              'Check your email for the response on this application'),
          actions: [
            TextButton(
              child: const Text('Back'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        );
      },
    );
  }
}

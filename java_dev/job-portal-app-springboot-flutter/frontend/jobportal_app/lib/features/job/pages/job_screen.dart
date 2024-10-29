import 'package:flutter/material.dart';
import 'package:jobportal_app/core/utils/api_response.dart';
import 'package:jobportal_app/features/job/models/job_model.dart';
import 'package:jobportal_app/features/job/pages/add_edit_job.dart';
import 'package:jobportal_app/features/job/pages/job_application_form.dart';
import 'package:jobportal_app/features/job/services/job_service.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  final JobService _jobService = JobService();
  List<Job> _jobs = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchJobs();
  }

  Future<void> _fetchJobs() async {
    final jobs = await _jobService.getAllJobs();
    setState(() {
      _jobs = jobs;
      _loading = false;
    });
  }

  void _deleteJob(Job job) async {
    bool? confirmDelete = await _showDeleteConfirmationDialog();
    if (confirmDelete != true) return;

    setState(() => _loading = true);
    try {
      ApiResponse response = await _jobService.deleteJob(job);
      if (response.success) {
        await _fetchJobs();
        _showSnackBar('Job deleted successfully!');
      } else {
        _showSnackBar('Failed to delete job: ${response.message}');
      }
    } catch (e) {
      _showSnackBar('An error occurred while deleting the job: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  void _navigateToAddJob() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JobForm()),
    );
    if (result == true) {
      _fetchJobs();
    }
  }

  void _navigateToEditJob(Job job) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JobForm(job: job)),
    );
    if (result == true) {
      _fetchJobs();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jobs")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _jobs.length,
              itemBuilder: (context, index) {
                final job = _jobs[index];
                return InkWell(
                  onTap: () {
                    _showApplicationConfirmationDialog(job);
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(job.title),
                      subtitle: Text(
                          "Company: ${job.companyName} | Deadline: ${job.applicationDeadline}"),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _navigateToEditJob(job),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteJob(job),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddJob,
        child: const Icon(Icons.add),
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
          title: const Text('Delete Profile'),
          content: const Text('Are you sure you want to delete this profile?'),
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

  _showApplicationConfirmationDialog(Job job) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Apply for ${job.title} position'),
          content: const Text('Considering applying? Click apply to continue'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
                child: const Text('Apply'),
                onPressed: () {
                  _navigateToApplyJob(job);
                }),
          ],
        );
      },
    );
  }

  void _navigateToApplyJob(Job job) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JobApplicationForm(job: job)),
    );
    if (result == true) {
      _fetchJobs();
    }
  }
}

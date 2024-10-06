import 'package:flutter/material.dart';
import 'package:jobportal_app/configs/utils/api_mock_services.dart';

class HomePage extends StatelessWidget {
  final List<Job> jobs = MockService.getJobs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Jobs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Handle filter
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add a new job (admin only feature)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.work_outline),
                title: Text(jobs[index].title),
                subtitle: Text('Location: ${jobs[index].location}'),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${jobs[index].applicants} Applicants'),
                    if (jobs[index].isNew)
                      const Text('New', style: TextStyle(color: Colors.green)),
                  ],
                ),
                onTap: () {
                  // Handle job details
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

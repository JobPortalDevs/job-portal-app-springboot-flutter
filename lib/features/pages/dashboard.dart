import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobportal_app/features/models/jobModel.dart';
import 'package:jobportal_app/features/pages/AddJob.dart';
import 'package:jobportal_app/features/pages/view_profile.dart';
import 'package:jobportal_app/features/reusableComponoents/jobtile.dart';
// import 'package:jobportal_app/configs/utils/api_mock_services.dart';



final _jobsProvider = StateProvider<List<Job>>((ref) => []); //update to use future provider

class HomePage extends ConsumerWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

      final List<Job> jobs = ref.watch(_jobsProvider);
      final List<Job> filteredJobs = ref.watch(_jobsProvider);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
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
              //logic to verify whether particular person is admin
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Addjob()),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.all(5),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15)
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ViewProfile()),
                  );
                },
                icon: const Icon(Icons.person, color: Colors.black,)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  const Text("Recent Uploads"),
                  SizedBox(
                    height: 400,
                    child: GridView.builder(         // allow overflow
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, 
                        mainAxisSpacing: 30),
                        scrollDirection: Axis.horizontal,
                        itemCount: jobs.length,        //change to recent uploads
                     itemBuilder: (BuildContext context, int index) {
                        return  JobCard(job: jobs[index], onPressed: () {  },);        // pass in job as param
                       },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: filteredJobs.length,
                  itemBuilder: (context, index) {
                  
                  return  JobCard(job: filteredJobs[index], onPressed: () {  },);
                  
                    // return Card(        
                    //   elevation: 2,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(12),
                    //   ),
                    //   margin: const EdgeInsets.symmetric(vertical: 8),
                    //   child: ListTile(
                    //     leading: const Icon(Icons.work_outline),
                    //     title: Text(jobs[index].title),
                    //     subtitle: Text('Location: ${jobs[index].location}'),
                    //     trailing: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.end,
                    //       children: [
                    //         Text('${jobs[index].applicants} Applicants'),
                    //         if (jobs[index].isNew)
                    //           const Text('New', style: TextStyle(color: Colors.green)),
                    //       ],
                    //     ),
                    //     onTap: () {
                    //       // Route to view job
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => ViewJob(job: jobs[index])),
                    //       );
                    //     },
                    //   ),
                    // );
                
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

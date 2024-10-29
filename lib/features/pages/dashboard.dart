import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobportal_app/features/models/jobModel.dart';
import 'package:jobportal_app/features/pages/AddJob.dart';
import 'package:jobportal_app/features/pages/user_profile_screen.dart';
import 'package:jobportal_app/features/pages/view_profile.dart';
import 'package:jobportal_app/features/reusableComponoents/jobCard.dart';
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
         
           Container(
            // padding: const EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25)
            ),
            child:  IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white,),
            onPressed: () {
              // Handle filter
            },
          ),
          ),
           Container(
            // padding: const EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25)
            ),
            child:  IconButton(
            icon: const Icon(Icons.add, color: Colors.white,),
            onPressed: () {
              // Add a new job (admin only feature)
              // fy whether particular person is admin
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Addjob()),
              );
            },
          ),
          ),
           Container(
            // padding: const EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25)
            ),
            child:  IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    // MaterialPageRoute(builder: (context) => const ViewProfile()),
                    MaterialPageRoute(builder: (context) => const UserProfileScreen()),
                  );
                },
                icon: const Icon(Icons.person, color: Colors.white,)
                ),
          ),
         
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Recent Uploads", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                  Container(
                    height: 400,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GridView.builder(         // allow overflow
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, 
                        mainAxisSpacing: 30),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,        //change to recent uploads
                     itemBuilder: (BuildContext context, int index) {
                        return  const JobCard(
                          // job: jobs[index], onPressed: () {  },
                          );        // pass in job as param
                       },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text("Recent Uploads", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                  SizedBox(
                    height: 800,
                    child:   
                    GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, 
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 30),
                            scrollDirection: Axis.vertical,
                  
                      itemCount: 40,
                      itemBuilder: (context, index) {
                      
                      return  const JobCard(
                        // job: filteredJobs[index], onPressed: () {  },
                        );
                      
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
            ],
          ),
        ),
      ),
    );
  }
}

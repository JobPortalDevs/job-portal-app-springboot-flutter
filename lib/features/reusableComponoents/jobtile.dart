import 'package:flutter/material.dart';
import 'package:jobportal_app/features/models/jobModel.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.job, required this.onPressed});
final Job job;
final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
          return GestureDetector(
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: List.filled(3, const BoxShadow(color: Colors.black12, blurRadius: 2)) // adjust box shadow
              ),
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              
              child: Column(
                children: [
                  Container(
                    decoration:const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)) //change radius adjustment
                    ),
                  
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)
                            ),
                            child: const Icon(Icons.work, color: Colors.grey,)),
                             Text(job.title)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.blue,         //change default color
                    child:  Column(
                      children: [
                        Text("company:   $job['companyName'] "),
                        const SizedBox(height: 5,),
                        Text("location:     $job['location'] "),
                        const SizedBox(height: 5,),
                        Text("date posted: $job['datePosted']"),
                        const SizedBox(height: 5,),
                        Text("deadline day:  $job['duedate'] "),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      
    
  }
import 'package:flutter/material.dart';
import 'package:jobportal_app/features/models/jobModel.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key, });

  @override
  Widget build(BuildContext context) {
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
              color: Colors.grey,
                boxShadow: List.filled(3, const BoxShadow(color: Colors.black12, blurRadius: 2)) // adjust box shadow
              ),
              padding: const EdgeInsets.all(10),
              child: Column(

                children: [
                  Container(
                    decoration:const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)) //change radius adjustment
                    ),
                  
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.start,
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
                             Text("Software developer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Color.fromARGB(255, 175, 215, 248),    
                    width: double.infinity,     //change default color
                    height: 220,     //change default color
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("company:"),
                            Text("Abc holding"),
                          ],
                        ),
                       
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("location:"),
                            Text("123 street"),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("date posted: 12:12:12:"),
                            Text("12:12:12"),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("deadline day:"),
                            Text("12:12:12"),
                          ],
                        ),
                        const SizedBox(height: 5,),
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      
  }
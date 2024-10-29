import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: List.filled(
                3,
                const BoxShadow(
                    color: Colors.black12, blurRadius: 2)) // adjust box shadow
            ),
        padding: const EdgeInsets.all(30),
        child: Container(
          decoration: BoxDecoration(
            
          color: const Color.fromARGB(172, 158, 158, 158),
borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight:
                            Radius.circular(20)) //change radius adjustment
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
                              borderRadius: BorderRadius.circular(40)),
                          child: const Icon(
                            Icons.work,
                            color: Colors.grey,
                          )),
                      const Text(
                        "Software developer",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                color: const Color.fromARGB(178, 170, 214, 250),
borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                ),
                width: double.infinity, //change default color
                height: 140, //change default color
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("company:"),
                        Text("Abc holding"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("location:"),
                        Text("123 street"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("date posted:"),
                        Text("12:12:12"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("deadline day:"),
                        Text("12:12:12"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

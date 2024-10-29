import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobportal_app/features/pages/dashboard.dart';
import 'package:jobportal_app/providers/base_urlProvider.dart';

final titleProvider = StateProvider<String>((ref) => '');
final descriptionProvider = StateProvider<String>((ref) => '');
final locationProvider = StateProvider<String>((ref) => '');
final companyNameProvider = StateProvider<String>((ref) => '');
final dueDateProvider = StateProvider<String>((ref) => '');

class Addjob extends ConsumerWidget {
  const Addjob({super.key});

  BuildContext? get context => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String errorMessage = "";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post new Job"),
      ),
      body: Container(
        child: Form(
            child: Column(
          children: [
            TextField(
              cursorColor: Colors.black,
              onChanged: (value) =>
                  ref.read(titleProvider.notifier).state = value,
              decoration: const InputDecoration(
                  icon: Icon(Icons.work),
                  hintText: "Company Name",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              cursorColor: Colors.black,
              onChanged: (value) =>
                  ref.read(titleProvider.notifier).state = value,
              decoration: const InputDecoration(
                  icon: Icon(Icons.work),
                  hintText: "job title",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              cursorColor: Colors.black,
              onChanged: (value) =>
                  ref.read(descriptionProvider.notifier).state = value,
              decoration: const InputDecoration(
                  icon: Icon(Icons.work),
                  hintText: "job description",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              cursorColor: Colors.black,
              onChanged: (value) =>
                  ref.read(locationProvider.notifier).state = value,
              decoration: const InputDecoration(
                  icon: Icon(Icons.work),
                  hintText: "location",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              cursorColor: Colors.black,
              onChanged: (value) =>
                  ref.read(locationProvider.notifier).state = value,
              decoration: const InputDecoration(
                  icon: Icon(Icons.work),
                  hintText: "deadline date", //change to datetime picker
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 12,
                    padding: const EdgeInsets.all(5)),
                onPressed: () => _PostJob(ref, context),
                child: const Text("Post"),
              ),
            )
          ],
        )),
      ),
    );
  }
}

Future<void> _PostJob(WidgetRef ref, BuildContext context) async {
  final title = ref.watch(titleProvider);
  final description = ref.watch(descriptionProvider);
  final location = ref.watch(locationProvider);
  final companyName = ref.watch(companyNameProvider);
  final dueDate = ref.watch(dueDateProvider);

  final url = Uri.parse('$base_url/postjob');
  try {
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'title': title,
            'description': description,
            'companyName': companyName,
            'dueDate': dueDate,
            'location': location
          },
        ));

    if (response.statusCode == 201) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${response.statusCode}')),
      );
    }
  } on Exception catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An error occurred: $e')),
    );
  }
}


// did not implement error printing code
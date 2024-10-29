import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:jobportal_app/configs/utils/api_mock_services.dart';
import 'package:jobportal_app/features/models/jobModel.dart';
import 'package:jobportal_app/providers/base_urlProvider.dart';

class JobService {
  final String jobBaseUrl = "$base_url/api/jobs";

  Future<List<Job>> getAllJobs() async {
    final response = await http.get(Uri.parse(jobBaseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => Job.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load jobs");
    }
  }

  Future<Job> createJob(Job job) async {
    final response = await http.post(
      Uri.parse(jobBaseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(job.toJson()),
    );

    if (response.statusCode == 200) {
      return Job.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create job");
    }
  }
}

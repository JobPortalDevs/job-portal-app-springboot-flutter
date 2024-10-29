import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobportal_app/constants/apis/urls.dart';
import 'package:jobportal_app/core/utils/api_response.dart';
import 'package:jobportal_app/features/job/models/job_model.dart';

class JobService {
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

  Future<Job> updateJob(Job job) async {
    final response = await http.put(
        Uri.parse("$jobBaseUrl/${job.id}/update-job"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(job.toJson()));
    if (response.statusCode == 200) {
      print("Updating profile with id: ${job.id}");
      return Job.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update job");
    }
  }

  Future<ApiResponse> deleteJob(Job job) async {
    final response =
        await http.delete(Uri.parse("$jobBaseUrl/${job.id}/delete"));
    if (response.statusCode == 204) {
      return ApiResponse(
        success: true,
        data: null,
        message: 'Job deleted successfully',
      );
    } else {
      return ApiResponse(
        success: false,
        data: null,
        message: 'Failed to delete job. Status code: ${response.statusCode}',
      );
    }
  }
}

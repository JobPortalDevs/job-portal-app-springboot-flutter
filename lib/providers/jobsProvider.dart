import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:jobportal_app/features/models/jobModel.dart';
import 'package:jobportal_app/providers/base_urlProvider.dart';

class FetchJobs {
  
  Future<List<Job>> getJobs() async {

    Response response = await get(Uri.parse('$base_url/get_jobs'), 
     headers: {
          'Content-Type': 'application/json',
        },
    
    );
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
        final List result = jsonResponse['data'];
      return result.map(((e) => Job.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final apiProvider = Provider<FetchJobs>((ref) => FetchJobs());
final jobsDataProvider = FutureProvider<List<Job>>(
  (ref) {
    return ref.read(apiProvider).getJobs();
  },
);


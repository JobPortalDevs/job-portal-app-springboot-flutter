import 'package:jobportal_app/features/job/models/job_model.dart';
import 'package:jobportal_app/features/user_profile/models/user_profile_model.dart';

class JobApplication {
  int? id;
  Job job;
  String proficiency;
  String resumeLink;
  List<String>? skills;
  String graduateValue;
  //dateApplied
  UserProfile employer;

  JobApplication({
    required this.id,
    required this.job,
    required this.proficiency,
    required this.resumeLink,
    required this.skills,
    required this.graduateValue,
    required this.employer,
  });

  factory JobApplication.fromJson(Map<String, dynamic> json) {
    return JobApplication(
        id: json["id"],
        job: json["job"],
        proficiency: json["proficiency"],
        resumeLink: json["resumeLink"],
        skills: json["skills"],
        graduateValue: json["graduateValue"],
        employer: json["employer"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "job": job,
      "proficiency": proficiency,
      "resumeLink": resumeLink,
      "skills": skills,
      "graduateValue": graduateValue,
      "employer": employer
    };
  }
}

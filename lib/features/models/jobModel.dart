
class Job {
  final int id;
  final String title;
  final String description;
  final String location;
  final String companyName;
  final DateTime postedDate;
  final DateTime applicationDeadline;
    String employer;


  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.companyName,
    required this.postedDate,
    required this.applicationDeadline,
     required this.employer,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      companyName: json['companyName'] as String,
      postedDate: DateTime.parse(json['postedDate'] as String),
      applicationDeadline: DateTime.parse(json['applicationDeadline'] as String),
  employer: json["employer"]);
  }

   Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "location": location,
      "companyName": companyName,
      "postedDate": postedDate.toIso8601String(),
      "applicationDeadline": applicationDeadline.toIso8601String(),
      "employer": employer
    };
  }

  @override
  String toString() {
    return 'Job{id: $id, title: $title, description: $description, location: $location, companyName: $companyName, postedDate: $postedDate, applicationapplicationDeadline: $applicationDeadline}';
  }
}

class Job {
  int? id;
  String title;
  String description;
  String location;
  String companyName;
  DateTime postedDate;
  DateTime applicationDeadline;
  //String employer;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.companyName,
    required this.postedDate,
    required this.applicationDeadline,
    // required this.employer,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      location: json["location"],
      companyName: json["companyName"],
      postedDate: DateTime.parse(json["postedDate"]),
      applicationDeadline: DateTime.parse(json["applicationDeadline"]),
      //employer: json["employer"]
    );
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
      //"employer": employer
    };
  }
}

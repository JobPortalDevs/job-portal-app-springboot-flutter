class Application {
  final int id;
  final int applicantId;
  final String applicantName;
  final bool status;
  final DateTime dateSubmitted;
  final DateTime dateUpdated;

  Application(
      {required this.id,
      required this.applicantId,
      required this.applicantName,
      required this.status,
      required this.dateSubmitted,
      required this.dateUpdated});

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      id: json['id'],
      applicantId: json['applicantId'],
      applicantName: json['applicantName'],
      status: json['status'],
      dateSubmitted: json['dateSubmitted'],
      dateUpdated: json['dateUpdated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'applicantId': applicantId,
      'applicantName': applicantName,
      'status': status,
      'dateSubmitted': dateSubmitted,
      'speciality': dateUpdated,
    };
  }
}

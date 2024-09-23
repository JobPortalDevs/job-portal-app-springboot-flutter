class Job {
  final String title;
  final String location;
  final int applicants;
  final bool isNew;

  Job(
      {required this.title,
      required this.location,
      required this.applicants,
      this.isNew = false});
}

class MockService {
  static List<Job> getJobs() {
    return [
      Job(
          title: 'Product Designer',
          location: 'Remote',
          applicants: 8,
          isNew: true),
      Job(
          title: 'Senior Front-End Developer',
          location: 'Guantun',
          applicants: 9,
          isNew: true),
      Job(title: 'Account Coordinator', location: 'Tangping', applicants: 3),
      Job(title: 'QA Lead', location: 'Remote', applicants: 6),
      Job(
          title: 'UI/UX Designer',
          location: 'Qixia',
          applicants: 9,
          isNew: true),
      Job(title: 'HR Manager', location: 'New York', applicants: 4),
      Job(title: 'iOS Developer', location: 'Remote', applicants: 9),
    ];
  }
}

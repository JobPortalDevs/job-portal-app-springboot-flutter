
import 'package:jobportal_app/features/models/jobModel.dart';

class MockService {
  static List<Job> getJobs() {
    return [
      Job(
          title: 'Product Designer',
          location: 'Remote', id: 6, description: '', companyName: '', postedDate: DateTime(2024, 1, 12), applicationDeadline: DateTime(2015, 02, 15), employer: 'abc auctineers'
        ),
      Job(
          title: 'Senior Front-End Developer',
          location: 'Guantun', id: 6, description: '', companyName: '', postedDate: DateTime(2024, 1, 12), applicationDeadline: DateTime(2015, 02, 15), employer: 'abc auctineers'
          ),
      Job(title: 'Account Coordinator', location: 'Tangping', id: 6, description: '', companyName: '', postedDate: DateTime(2024, 1, 12), applicationDeadline: DateTime(2015, 02, 15), employer: 'abc auctineers'),
      Job(title: 'QA Lead', location: 'Remote', id: 6, description: '', companyName: '', postedDate: DateTime(2024, 1, 12), applicationDeadline: DateTime(2015, 02, 15), employer: 'abc auctineers' ),
      Job(
          title: 'UI/UX Designer',
          location: 'Qixia',
          id: 6, description: '', companyName: '', postedDate: DateTime(2024, 1, 12), applicationDeadline: DateTime(2015, 02, 15), employer: 'abc auctineers', 
         ),
      Job(title: 'HR Manager', location: 'New York', id: 3, description: '', companyName: '', postedDate: DateTime(2024, 1, 12), applicationDeadline: DateTime(2012, 12, 12), employer: 'atoz buyers', ),
      Job(title: 'iOS Developer', location: 'Remote', id: 7, description: '', companyName: '', postedDate: DateTime(2024, 1, 12), applicationDeadline: DateTime(2012, 12, 12), employer: 'atoz buyers',  ),
    ];
  }
}

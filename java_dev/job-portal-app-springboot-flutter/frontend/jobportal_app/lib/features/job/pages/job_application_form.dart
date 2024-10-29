// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jobportal_app/core/components/build_button.dart';
import 'package:jobportal_app/features/job/models/job_application_model.dart';
import 'package:jobportal_app/features/job/models/job_model.dart';
import 'package:jobportal_app/features/job/services/job_application_service.dart';
import 'package:jobportal_app/features/user_profile/models/user_profile_model.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class JobApplicationForm extends StatefulWidget {
  final JobApplication? jobApplication;
  final Job? job;
  final UserProfile? employer;

  const JobApplicationForm(
      {super.key, this.jobApplication, this.job, this.employer});

  @override
  // ignore: library_private_types_in_public_api
  _JobApplicationFormState createState() => _JobApplicationFormState();
}

class _JobApplicationFormState extends State<JobApplicationForm> {
  final _formKey = GlobalKey<FormState>();
  final JobApplicationService _jobApplicationService = JobApplicationService();

  String proficiency = "Junior";
  late TextEditingController resumeLinkController;
  late MultiSelectController<dynamic> skillsController =
      MultiSelectController();
  String graduateValue = "Non-graduate";
  late Job job;
  late UserProfile employer;
  List<String>? _selectedSkills = [];

  final List<String> _skills = [
    "Ansible",
    "AWS",
    "Azure",
    "C#",
    "Django",
    "Docker",
    "Flutter",
    "Git",
    "Javascript",
    "Kubernetes",
    ".NET Framework",
    "Nginx",
    "NodeJS",
    "PowerShell",
    "Python",
    "Rust",
    "Redis",
    "SpringBoot",
    "Terraform",
    "TypeScript",
  ];

  @override
  void initState() {
    super.initState();
    proficiency = proficiency;
    resumeLinkController =
        TextEditingController(text: widget.jobApplication?.resumeLink ?? "");
    setState(() {
      _selectedSkills = widget.jobApplication?.skills;
    });
    graduateValue = graduateValue;
    job = Job(
        id: 0,
        title: "",
        description: "",
        location: "",
        companyName: "",
        postedDate: DateTime.parse('2000-01-01 00:00:00Z'),
        applicationDeadline: DateTime.parse('2000-01-01 00:00:00Z'));
  }

  @override
  void dispose() {
    resumeLinkController.dispose();
    skillsController.dispose();
    super.dispose();
  }

  void _saveJobApplication() async {
    if (_formKey.currentState!.validate()) {
      JobApplication jobApplication = JobApplication(
        id: widget.jobApplication?.id,
        job: job,
        employer: employer,
        proficiency: proficiency,
        resumeLink: resumeLinkController.text,
        skills: _selectedSkills,
        graduateValue: graduateValue,
      );

      try {
        if (widget.jobApplication == null) {
          await _jobApplicationService.createJobApplication(jobApplication);
        } else {
          await _jobApplicationService.updateJobApplication(jobApplication);
        }
        Navigator.pop(context, true);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to save job application: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.jobApplication == null
              ? "Job application"
              : "Edit job application")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: resumeLinkController,
                decoration: InputDecoration(labelText: "Link to your resume"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter the resume link" : null,
              ),
              DropdownButtonFormField(
                value: proficiency,
                items: ["Junior", "Mid-level", "Senior"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) => setState(() => proficiency = value!),
                decoration:
                    const InputDecoration(labelText: "Proficiency level"),
              ),
              const SizedBox(height: 5),
              // MultiSelectDropDown(
              //   hint: "Select your skills",
              //   hintStyle: const TextStyle(fontSize: 18),
              //   searchEnabled: true,
              //   controller: skillsController,
              //   onOptionSelected: (options) {
              //     _selectedSkills =
              //         options.map((e) => e.value.toString()).toList();
              //   },
              //   options: _skills
              //       .map((skill) => ValueItem(label: skill, value: skill))
              //       .toList(),
              //   maxItems: 10,
              //   selectionType: SelectionType.multi,
              //   chipConfig: const ChipConfig(wrapType: WrapType.wrap),
              //   dropdownHeight: 300,
              //   optionTextStyle: const TextStyle(fontSize: 18),
              //   selectedOptionIcon: const Icon(Icons.check_circle),
              // ),
              DropdownButtonFormField(
                value: graduateValue,
                items: ["Non-graduate", "Graduate"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) => setState(() => graduateValue = value!),
                decoration: const InputDecoration(labelText: "Graduate Status"),
              ),
              const SizedBox(height: 20),
              buildButton(
                  context: context,
                  title: widget.jobApplication == null
                      ? "Apply"
                      : "Update Application",
                  icon: null,
                  onPressed: _saveJobApplication,
                  color: Colors.purple,
                  foregroundColor: Colors.white,
                  textColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

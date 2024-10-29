import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobportal_app/core/components/build_button.dart';
import 'package:jobportal_app/features/job/models/job_model.dart';
import 'package:jobportal_app/features/job/services/job_service.dart';

class JobForm extends StatefulWidget {
  final Job? job; // Null for adding new, non-null for editing

  JobForm({this.job});

  @override
  _JobFormState createState() => _JobFormState();
}

class _JobFormState extends State<JobForm> {
  final _formKey = GlobalKey<FormState>();
  final JobService _jobService = JobService();

  // Text controllers for the fields
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController postedDateController = TextEditingController();
  final TextEditingController applicationDeadlineController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.job != null) {
      _loadJobData(widget.job!);
    }
  }

  void _loadJobData(Job job) {
    titleController.text = job.title;
    descriptionController.text = job.description;
    locationController.text = job.location;
    companyNameController.text = job.companyName;
    postedDateController.text = job.postedDate.toIso8601String();
    applicationDeadlineController.text =
        job.applicationDeadline.toIso8601String();
  }

  Future<void> _selectedDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    companyNameController.dispose();
    postedDateController.dispose();
    applicationDeadlineController.dispose();
    super.dispose();
  }

  void _saveJob() async {
    if (_formKey.currentState!.validate()) {
      Job job = Job(
        id: widget.job?.id,
        title: titleController.text,
        description: descriptionController.text,
        location: locationController.text,
        companyName: companyNameController.text,
        postedDate: DateTime.parse(postedDateController.text),
        applicationDeadline: DateTime.parse(applicationDeadlineController.text),
      );

      try {
        if (widget.job == null) {
          await _jobService.createJob(job);
        } else {
          print("Job update expected");
          await _jobService.updateJob(job);
        }
        Navigator.pop(context, true);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Failed to save job: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.job == null ? "Add Job" : "Edit Job")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Job Title"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter a job title" : null,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Job Description"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter a job description" : null,
              ),
              TextFormField(
                controller: locationController,
                decoration: InputDecoration(labelText: "Location"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter the location" : null,
              ),
              TextFormField(
                controller: companyNameController,
                decoration: InputDecoration(labelText: "Company Name"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter the company name" : null,
              ),
              _buildDatePickerField(postedDateController, "Date Posted"),
              _buildDatePickerField(applicationDeadlineController, "Deadline"),
              SizedBox(height: 20),
              buildButton(
                  context: context,
                  title: widget.job == null ? "Create" : "Update",
                  icon: null,
                  onPressed: _saveJob,
                  color: Colors.purple,
                  foregroundColor: Colors.white,
                  textColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            suffixIcon: InkWell(
              child: IconButton(
                icon: Icon(Icons.arrow_drop_down_rounded),
                onPressed: () => _selectedDate(context, controller),
              ),
            )),
      ),
    );
  }
}

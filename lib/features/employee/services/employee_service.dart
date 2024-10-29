import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobportal_app/features/models/employeeModel.dart';
import 'package:jobportal_app/providers/base_urlProvider.dart';
// import 'package:jobportal_app/constants/apis/urls.dart';
// import 'package:jobportal_app/features/models/employee_model.dart';
class EmployeeService {
  final String employeeBaseUrl = "$base_url/api/employees";

  Future<List<Employee>> getAllEmployees() async {
    final response = await http.get(Uri.parse(employeeBaseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => Employee.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load employees");
    }
  }

  Future<Employee> createEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse(employeeBaseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(employee.toJson()),
    );

    if (response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create employee");
    }
  }
}

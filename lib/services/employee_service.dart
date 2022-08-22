import 'dart:io';

import '../services/base_service.dart';
import '../models/employee.dart';

class EmployeeService {

  static Future<Map<String, dynamic>> addEmployee(Employee employee, File? file) async {
    var body = await BaseService.multipartRequest(
      path: '/api/v1/employees/addEmployee',
      data: employee,
      fieldName: "employee",
      file: file,
    );
    return body;
  }

  static Future<Map<String, dynamic>> updateEmployee(Employee employee, File? file) async {
    var body = await BaseService.multipartRequest(
      path: '/api/v1/employees/updateEmployee',
      data: employee,
      fieldName: "employee",
      file: file,
      requestType: 'PATCH',
    );
    return body;
  }

  static Future<Map<String, dynamic>> deleteEmployee(int employeeId) async {
    var body = await BaseService.deleteRequest('/api/v1/employees/deleteEmployee/$employeeId');
    return body;
  }

  static Future<Map<String, dynamic>> getAllEmployee() async {
    var body = await BaseService.getRequest('/api/v1/employees/getAllEmployee');
    return body;
  }

}

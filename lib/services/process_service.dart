import '../models/app_process.dart';
import 'base_service.dart';

class ProcessService {

  static Future<Map<String, dynamic>> addProcess(AppProcess process) async {
    var body = await BaseService.postRequest(
        path: '/api/v1/processes/addProcess',
        data: process
    );
    return body;
  }

  static Future<Map<String, dynamic>> getAllProcess() async {
    var body = await BaseService.getRequest('/api/v1/processes/getAllProcess');
    return body;
  }
}
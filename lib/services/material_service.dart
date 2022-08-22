import 'dart:io';

import '../models/app_material.dart';
import 'base_service.dart';

class MaterialService {

  static Future<Map<String, dynamic>> addMaterial(AppMaterial material, File? file) async {
    var body = await BaseService.multipartRequest(
      path: '/api/v1/materials/addMaterial',
      data: material,
      fieldName: "material",
      file: file,
    );
    return body;
  }

  static Future<Map<String, dynamic>> updateMaterial(AppMaterial material, File? file) async {
    var body = await BaseService.multipartRequest(
      path: '/api/v1/materials/updateMaterial',
      data: material,
      fieldName: "material",
      file: file,
      requestType: 'PATCH',
    );
    return body;
  }

  static Future<Map<String, dynamic>> deleteMaterial(int materialId) async {
    var body = await BaseService.deleteRequest('/api/v1/materials/deleteMaterial/$materialId');
    return body;
  }

  static Future<Map<String, dynamic>> getAllMaterial() async {
    var body = await BaseService.getRequest('/api/v1/materials/getAllMaterial');
    return body;
  }

  static Future<Map<String, dynamic>> getByReferenceNumber(int referenceNumber) async {
    var body = await BaseService.getRequest('/api/v1/materials/getByReferenceNumber/$referenceNumber');
    return body;
  }

}

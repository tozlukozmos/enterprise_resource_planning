import 'dart:io';

import '../models/app_material.dart';
import 'base_service.dart';

class MaterialService {

  static Future<Map<String, dynamic>> getAllMaterials() async {
    var body = await BaseService.getRequest('/api/v1/materials/getAllMaterial');
    return body;
  }

  static Future<Map<String, dynamic>> getByReferenceNumber(int referenceNumber) async {
    var body = await BaseService.getRequest('/api/v1/materials/getByReferenceNumber?referenceNumber=$referenceNumber');
    return body;
  }

  static Future<Map<String, dynamic>> addMaterial(AppMaterial material, File? file) async {
    var body = await BaseService.multipartRequest(
      path: '/api/v1/materials/addMaterial',
      fieldName: "material",
      data: material,
      file: file,
    );
    return body;
  }

  static Future<Map<String, dynamic>> updateMaterial(AppMaterial material) async {
    var body = await BaseService.patchRequest(
        path: '/api/v1/materials/updateMaterial',
        data: material
    );
    return body;
  }

}
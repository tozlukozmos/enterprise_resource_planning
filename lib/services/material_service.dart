import '../models/app_material.dart';
import 'base_service.dart';

class MaterialService {

  static Future<Map<String, dynamic>> getAllMaterials() async {
    var body = await BaseService.getRequest('/api/v1/materials/getAllMaterials');
    return body;
  }

  static Future<Map<String, dynamic>> getByReferenceNumber(int referenceNumber) async {
    var body = await BaseService.getRequest('/api/v1/materials/getByReferenceNumber?referenceNumber=$referenceNumber');
    return body;
  }

  static Future<Map<String, dynamic>> addMaterial(AppMaterial material) async {
    var body = await BaseService.postRequest(
        path: '/api/v1/materials/addMaterial',
        data: material
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

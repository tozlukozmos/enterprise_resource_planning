import '../services/base_service.dart';

class UserService {

  static Future<Map<String, dynamic>> logIn(String username, String password) async {
    Map<String, dynamic> userData = {
      "username": username,
      "password": password,
    };
    var body = await BaseService.postRequest(
      path: '/api/v1/auth/logIn',
      data: userData,
      isLogin: true,
    );
    return body;
  }

}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../models/user.dart';
import '../storage/storage.dart';

class BaseService {
  static String baseUrl = 'https://api-first-java-backend-project.herokuapp.com';
  //static String baseUrl = 'http://192.168.2.112:8080';
  static SecureStorage secureStorage = SecureStorage();

  static Future<Map<String, dynamic>> getRequest(String path) async {
    String token = await secureStorage.readSecureData('token');
    var url = Uri.parse(baseUrl + path);
    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    var response = await http.get(url, headers: headers);
    var body = jsonDecode(utf8.decode(response.bodyBytes));
    return body;
  }

  static Future<Map<String, dynamic>> postRequest({
    required String path,
    dynamic data,
    bool isLogin = false,
  }) async {
    String token = await secureStorage.readSecureData('token') ?? "";
    var url = Uri.parse(baseUrl + path);
    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    var response = await http.post(url, body: isLogin ? json.encode(data) : json.encode(data.toJson()), headers: headers);
    var body = jsonDecode(utf8.decode(response.bodyBytes));
    print(body);
    if(body["success"] && isLogin){
      User user = User.fromJson(body["data"]);
      await secureStorage.writeSecureData('firstName', user.firstName);
      await secureStorage.writeSecureData('lastName', user.lastName);
      await secureStorage.writeSecureData('email', user.email);
      await secureStorage.writeSecureData('phoneNumber', user.phoneNumber);
      await secureStorage.writeSecureData('userId', user.userId.toString());
      await secureStorage.writeSecureData('token', body["token"]);
    }
    return body;
  }

  static Future<Map<String, dynamic>> putRequest({String path = "", dynamic data}) async {
    String token = await secureStorage.readSecureData('token');
    var url = Uri.parse(baseUrl + path);
    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    var response = await http.put(url, body: json.encode(data.toJson()), headers: headers);
    var body = jsonDecode(utf8.decode(response.bodyBytes));
    return body;
  }

  static Future<Map<String, dynamic>> patchRequest({String path = "", dynamic data}) async {
    String token = await secureStorage.readSecureData('token');
    var url = Uri.parse(baseUrl + path);
    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    var response = await http.patch(url, body: json.encode(data.toJson()), headers: headers);
    var body = jsonDecode(utf8.decode(response.bodyBytes));
    return body;
  }

  static Future<Map<String, dynamic>> deleteRequest(String path) async {
    String token = await secureStorage.readSecureData('token');
    var url = Uri.parse(baseUrl + path);
    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    var response = await http.delete(url, headers: headers);
    var body = jsonDecode(utf8.decode(response.bodyBytes));
    return body;
  }

  static Future<Map<String, dynamic>> multipartRequest({
    required String path,
    required String fieldName,
    dynamic data,
    String requestType = 'POST',
    File? file,
  }) async {
    String token = await secureStorage.readSecureData('token') ?? "";
    var url = Uri.parse(baseUrl + path);
    var request = http.MultipartRequest(requestType, url);
    request.headers.addAll({"Authorization": "Bearer $token"});
    request.fields[fieldName] = json.encode(data.toJson()).toString();

    if(file != null) {
      request.files.add(await http.MultipartFile.fromPath("file", file.path));
    }

    var response = await request.send();
    var responded = await http.Response.fromStream(response);

    var body = jsonDecode(utf8.decode(responded.bodyBytes));
    print(body);
    return body;
  }

}
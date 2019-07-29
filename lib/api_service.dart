import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class Response {

  final int code;
  
   Response({ this.code});

  Response.fromJson(Map<String, dynamic> json)
      :code = json['code'];

     getCode(){
        return code;
  }

}

class Students {

  final String name;
  final String surname;
  final String email;
  final String gender;
  final String dob;
  final String university;
  final String faculty;
  final String degree;
  final int yos;
  final String cellnumber;
  final String password;
  final DateTime createdAt;
  final String courseC;
  final String moduleN;
  final String description;
  final String marks;
  final String testDate;

  Students.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        surname = json['surname'],
        email = json['email'],
        gender = json['gender'],
        university = json['university'],
        faculty = json['faculty'],
        degree = json['degree'],
        yos = json['yos'],
        cellnumber = json['cellnumber'],
        dob = json['dob'],
        password = json['password'],
        courseC = json['courseC'],
        moduleN = json['moduleN'],
        description = json['description'],
        marks = json['marks'],
        testDate = json['testDate'],
        createdAt = DateTime.tryParse(json['created_at']) ?? new DateTime.now(),
        imageUrl = json['image_url'];

  final String imageUrl;

  @override
  String toString() => '$name, $email, $imageUrl , $gender, $surname, $university, $faculty, $degree, $yos, $cellnumber, $dob, $password';
}

class MyHttpException extends HttpException {
  final int statusCode;
  MyHttpException(this.statusCode, String message) : super(message);
}

class ApiService {
  static const String baseUrl = 'moshal-app.herokuapp.com';
  static const String xAccessToken = 'x-access-token';

  static ApiService instance;
  factory ApiService() => instance ??= ApiService._internal();
  ApiService._internal();

  // return message and token
  Future<Map<dynamic, dynamic>> loginUser(String email, String password) async {
    final url = new Uri.https(baseUrl, 'api/students/login');
  //  final credentials = '$email:$password';
//    final basic = 'Basic ${base64Encode(utf8.encode(credentials))}';
//   final json = await NetworkUtils.post(url, headers: {
//      HttpHeaders.AUTHORIZATION: basic,
//    });
//    return Response.fromJson(json);
    final body = <String, String> {
      'email': email,
      'password': password
    };
    final decoded = await NetworkUtils.post(url, body: body);
    String token  =decoded["token"];
    final code =decoded['code'];
    // debugPrint(token);
    String res = '{"code": $code,"token":"$token"}';
  //  debugPrint("login decoded:  $res");
    Map<dynamic, dynamic> map =jsonDecode(res);

    return map;
  }

  // return message
  Future<Response> registerUser(
      String name, String surname, String email, String gender, String dob, String university, String faculty, String degree, String yos, String cellnumber, String password) async {
    final url = new Uri.https(baseUrl, 'api/students/register');
    final body = <String, String>{
      'name': name,
      'surname' : surname,
      'email': email,
      'gender' : gender,
      'university' : university,
      'faculty' : faculty,
      'degree' : degree,
      'dob' : dob.toString(),
      'yos' :yos.toString(),
      'cellnumber' : cellnumber.toString(),
      'password': password,
    };

    final decoded = await NetworkUtils.post(url, body: body);
    debugPrint("reg decoded: "+ decoded);
    return new Response.fromJson(decoded);
  }

  Future<Response> marksSubmission(String courseCode, String moduleName, String description, String marks, String testDate) async {
    final url = new Uri.https(baseUrl, 'api/students/marks');
    final body = <String, String>{
      'courseCode': courseCode,
      'moduleName' : moduleName,
      'description': description,
      'marks' : marks,
      'testDate' : testDate.toString(),
    };

    final decoded = await NetworkUtils.post(url, body: body);
    return new Response.fromJson(decoded);
  }


  Future<Students> getUserProfile(String email, String token) async {
    final url = new Uri.https(baseUrl, '/students/$email');
    final json = await NetworkUtils.get(url, headers: {xAccessToken: token});
    return Students.fromJson(json);
  }

  // return message
  Future<Response> changePassword(
      String email, String password, String newPassword, String token) async {
    final url = new Uri.http(baseUrl, "/students/$email/password");
    final body = {'password': password, 'new_password': newPassword};
    final json = await NetworkUtils.put(
      url,
      headers: {xAccessToken: token},
      body: body,
    );
    return Response.fromJson(json);
  }

  // return message
  // special token and newPassword to reset password,
  // otherwise, send an email to email
  Future<Response> resetPassword(String email,
      {String token, String newPassword}) async {
    final url = new Uri.https(baseUrl, '/students/$email/password');
    final task = token != null && newPassword != null
        ? NetworkUtils.post(url, body: {
      'token': token,
      'new_password': newPassword,
    })
        : NetworkUtils.post(url);
    final json = await task;
    return Response.fromJson(json);
  }



   Future<List<dynamic>>   getstudents(String uni) async {
    final url = new Uri.https(baseUrl, 'api/users/students/$uni');
    final task = NetworkUtils.get(url);
    final json = await task;
    List<dynamic> students   =List();

      for (var item in json) {
        students.add(Students.fromJson(item));
      }
    debugPrint("${json.length}");
    return students;
  }

  //TODO Upload an image API
//  Future<Students> uploadImage(File file, String email) async {
//    final url = new Uri.https(baseUrl, '/students/upload');
//    final stream = new http.ByteStream(file.openRead());
//    final length = await file.length();
//    final request = new http.MultipartRequest('POST', url)
//      ..fields['user'] = email
//      ..files.add(
//        new http.MultipartFile('my_image', stream, length, filename: path.basename(file.path)),
//      );
//    final streamedReponse = await request.send();
//    final statusCode = streamedReponse.statusCode;
//    final decoded = json.decode(await streamedReponse.stream.bytesToString());
//
//    debugPrint('decoded: $decoded');
//
//    if (statusCode < 200 || statusCode >= 300) {
//      throw MyHttpException(statusCode, decoded['message']);
//    }
//
//    return Students.fromJson(decoded);
//  }

}

class NetworkUtils {
  static Future get(Uri url, {Map<String, String> headers}) async {
    final response = await http.get(url, headers: headers);
    final body = response.body;
    final statusCode = response.statusCode;
    if (body == null) {
      throw MyHttpException(statusCode, 'Response body is null');
    }
    final decoded = json.decode(body);
    if (statusCode < 200 || statusCode >= 300) {
      throw MyHttpException(statusCode, decoded['message']);
    }
    return decoded;
  }

  static Future post(Uri url,
      {Map<String, String> headers, Map<String, String> body}) {
    return _helper('POST', url, headers: headers, body: body);
  }

  static Future _helper(String method, Uri url,
      {Map<String, String> headers, Map<String, String> body}) async {
    final request = new http.Request(method, url);
    if (body != null) {
      request.bodyFields = body;
    }
    if (headers != null) {
      request.headers.addAll(headers);
    }
    final streamedReponse = await request.send();

    final statusCode = streamedReponse.statusCode;
    final decoded = json.decode(await streamedReponse.stream.bytesToString());
    decoded['code'] = statusCode;
    // debugPrint('decoded2: $decoded');

    if (statusCode < 200 || statusCode >= 300) {
      //throw MyHttpException(statusCode, decoded['message']);
      decoded['code'] = 404;
    }
    // debugPrint('decoded2: $decoded');
    return decoded;
  }

  static Future put(Uri url, {Map<String, String> headers, body}) {
    return _helper('PUT', url, headers: headers, body: body);
  }
}
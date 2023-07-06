import 'dart:convert';
import 'dart:io';

import 'package:daytrit/utils/url_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  var log = Logger();
  final storage = const FlutterSecureStorage();

  // get request
  Future getWithoutToken(String urlPath) async {
    var url = Uri.parse(formater(urlPath));
    print("URL: $url");
    var response = await http.get(
      url,
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return json.decode(response.body);
      }
      log.i(response.body);
      log.i(response.statusCode);
    } catch (e) {
      log.i(e.toString());
    }
  }

  Future getWithToken(String urlPath) async {
    var url = Uri.parse(formater(urlPath));
    print("URL: $url");
    String? token = await storage.read(key: "token");
    print('read Token  $token');
    var response = await http.get(
      url,
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return json.decode(response.body);
      }
      log.i(response.body);
      log.i(response.statusCode);
    } catch (e) {
      log.i(e.toString());
    }
  }

  // post request without token
  Future<dynamic> postWithoutToken(
      String urlPath, Map<String, dynamic> body) async {
    var url = Uri.parse(formater(urlPath));
    print("URL: $url");
    var response = await http.post(url,
        headers: {"content-type": "application/json"}, body: json.encode(body));
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        // log.i(response.body);
        // var decodedResponse = json.decode(response.body);
        // print("Decoded response: $decodedResponse");
        print("RESPONSE BODY: ${response.statusCode} ${response.body}");
        return response;
      }
    } catch (e) {
      log.i(e.toString());
    }
  }

  // post request with token
  Future<dynamic> postWithToken(
      dynamic urlPath, Map<String, dynamic> body) async {
    var url = Uri.parse(formater(urlPath));
    print("URL: $url");
    String? token = await storage.read(key: "token");

    var response = await http.post(url,
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode(body));
    print("token: $token");

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        log.d(response.body);
        log.d(response.statusCode);
        return response;
      }
    } catch (e) {
      log.i(e.toString());
    }
  }

  Future<dynamic> post(String url, {body, headers, encoding}) async {
    var responseJson;
    headers = {
      "accept": "application/json",
      "Authorization": "Bearer ${await storage.read(key: "token")}"
    };

    var response = await http.post(Uri.parse(baseUrl + url),
        body: body, headers: headers, encoding: encoding);
    try {
      final int statusCode = response.statusCode;
      print(response.body);
      print(response.statusCode);
      if (statusCode < 200) {
        throw Exception(
            "Error while fetching data, Error: ${response.statusCode}");
      }
      return response;
    } on SocketException {
      return response;
      throw SocketException("internet issue");
    }
  }

  // patch request
  Future<dynamic> patchWithToken(
      dynamic urlPath, Map<String, dynamic> data) async {
    var url = Uri.parse(formater(urlPath));
    print("URL: $url");
    String? token = await storage.read(key: "token");
    var response = await http.patch(url,
        headers: {"Authorization": "Bearer $token"}, body: jsonEncode(data));

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        log.i("Wrong credentials");
        log.d(response.body);
        log.d(response.statusCode);
        return response;
      }
    } catch (e) {
      log.i(e.toString());
    }
  }

  // put request
  Future<dynamic> putWithoutToken(
      dynamic urlPath, Map<String, dynamic> data) async {
    var url = Uri.parse(formater(urlPath));
    print("URL: $url");
    var response = await http.put(url,
        headers: {"Content-type": "application/json"}, body: jsonEncode(data));

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        log.i("Wrong credentials");
        log.d(response.body);
        log.d(response.statusCode);
        return response;
      }
    } catch (e) {
      log.i(e.toString());
    }
  }

  Future<dynamic> putWithToken(
      dynamic urlPath, Map<String, dynamic> data) async {
    String? token = await storage.read(key: "token");
    var url = Uri.parse(formater(urlPath));
    print("URL: $url");
    var response = await http.put(url,
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(data));

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        log.i("Wrong credentials");
        log.d(response.body);
        log.d(response.statusCode);
        return response;
      }
    } catch (e) {
      log.i(e.toString());
    }
  }

  Future<dynamic> deleteWithToken(
      dynamic urlPath, Map<String, dynamic> data) async {
    String? token = await storage.read(key: "token");
    var url = Uri.parse(formater(urlPath));
    print("URL: $url");
    var response = await http.put(url,
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(data));

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        log.i("Wrong credentials");
        log.d(response.body);
        log.d(response.statusCode);
        return response;
      }
    } catch (e) {
      log.i(e.toString());
    }
  }

  String formater(String url) {
    return baseUrl + url;
  }

  NetworkImage getImage(String username) {
    //change endpoint to the right endpoint
    String url = formater("/upload//$username.jpg");
    return NetworkImage(url);
  }

  Future<dynamic> postImage(
    dynamic urlPath,
    Map<String, dynamic> body,
    File file,
  ) async {
    var url = Uri.parse(formater(urlPath));
    print("URL: $url");
    print("body: $body");
    String? token = await storage.read(key: "token");

    var request = http.MultipartRequest('POST', url);
    Map<String, String> headers = {
      "content-type": "multipart/form-data",
      "Authorization": "Bearer $token"
    };
    print('red $request');
    request.files.add(await http.MultipartFile.fromPath('photo', file.path));
    // request.files.add(
    //   http.MultipartFile(
    //     'photo',
    //     file.readAsBytes().asStream(),
    //     file.lengthSync(),
    //     filename: filename,
    //     // contentType: MediaType('image', 'jpeg'),
    //   ),
    // );
    request.headers.addAll(headers);

    try {
      final streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        print('Image uploaded successfully!');
        return jsonDecode(response.body);
      } else {
        print('Error uploading image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}

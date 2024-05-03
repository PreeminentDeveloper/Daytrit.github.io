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

  Future getWithToken(
    String urlPath,
  ) async {
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
    print("resp: ${response.statusCode}");

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
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
        },
        body: json.encode(body));
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

  // post request without token
  Future<dynamic> postAlongWIthFileWithoutToken(
      {required String urlPath,
      // Map<String, dynamic> body,
      required String firstName,
      required String lastName,
      required dynamic phoneNumber,
      required String email,
      required String companyName,
      required String companyAddress,
      required dynamic idNumber,
      required String password,
      required String idCardType,
      required File? idFile,
      required File? companyCertificateFile}) async {
    var url = Uri.parse(formater(urlPath));
    print("URL: $url");

    var request = http.MultipartRequest('POST', url);
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-type': 'application/json',
    };

    request.fields['firstname'] = firstName;
    request.fields['lastname'] = lastName;
    request.fields['phone'] = phoneNumber;
    request.fields['email'] = email;
    request.fields['company'] = companyName;
    request.fields['address'] = companyAddress;
    request.fields['id_card_type'] = idCardType;
    request.fields['id_card_number'] = idNumber;
    request.fields['password'] = password;
    request.files
        .add(await http.MultipartFile.fromPath('id_card_photo', idFile!.path));
    request.files.add(await http.MultipartFile.fromPath(
        'company_certificate', companyCertificateFile!.path));

    request.headers.addAll(headers);

    try {
      final streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      // print("resp: ${response.body}");
      // dynamic decodedData = jsonDecode(response.body);
      print("status-code: ${response.statusCode}");
      print("body: ${response.body}");
      // print("decoded-data: $decodedData");
      // print("resp ${jsonDecode(response.body)}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Agent registered successfully!');
        return response;
      } else {
        print('Error registering agent. Status code: ${response.statusCode}');
        return response;
      }
    } catch (e) {
      print('Error registering agent: $e');
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
          'Accept': 'application/json',
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
      "content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${await storage.read(key: "token")}"
    };

    var response = await http.post(Uri.parse(baseUrl + url),
        body: json.encode(body), headers: headers, encoding: encoding);
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
      // throw SocketException("internet issue");
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

    String? token = await storage.read(key: "token");

    var request = http.MultipartRequest('POST', url);
    Map<String, String> headers = {
      "content-type": "multipart/form-data",
      "Authorization": "Bearer $token"
    };

    request.files.add(await http.MultipartFile.fromPath('photo', file.path));

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

  Future<dynamic> postImageWithText(
    dynamic urlPath,
    Map<String, dynamic> body,
    String caption,
    File file,
  ) async {
    var url = Uri.parse(formater(urlPath));

    String? token = await storage.read(key: "token");

    var request = http.MultipartRequest('POST', url);
    Map<String, String> headers = {
      "content-type": "multipart/form-data",
      "Authorization": "Bearer $token"
    };

    request.fields['type'] = 'image';
    request.fields['caption'] = caption;
    request.files.add(await http.MultipartFile.fromPath('file_url', file.path));

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

  Future<dynamic> postVendor(
      dynamic urlPath,
      // Map<String, dynamic> body,
      title,
      category,
      state,
      paymentMethod,
      cashPrice,
      requiredCheckoutField,
      rating,
      type,
      country,
      address,
      description,
      features,
      photo) async {
    var url = Uri.parse(formater(urlPath));
    print(url);
    print(
        "$title $category $state $paymentMethod $cashPrice $requiredCheckoutField $rating $type $country $address $description $features $photo");

    String? token = await storage.read(key: "token");
    print(token);

    var request = http.MultipartRequest('POST', url);
    print("request: $request");
    Map<String, String> headers = {
      "content-type": "multipart/form-data",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    print("headers: $headers");

    // "title": vendorTitle.value,
    //   "category": category,
    //   "state": state.value,
    //   "payment_method": paymentMethod,
    //   // "coin": coin.value,
    //   "cash_price": cashPrice.value,
    //   // "required_checkout_field": cashRequirement.value,
    //   "required_checkout_field": "[first_name]",
    //   "rating": rating.value,
    //   "type": type,
    //   "country": selectedStatus,
    //   "address": companyAddress.value,
    //   "description": description.value,
    //   "features": features.value,
    //   "photo": photo1!.path,
    //   // "photo_2": photo2,
    //   // "photo_3": photo3,
    //   // "photo_4": photo4

    request.fields['title'] = title;
    request.fields['category'] = category;
    request.fields['state'] = state;
    request.fields['payment_method'] = paymentMethod;
    request.fields['cash_price'] = cashPrice;
    request.fields['required_checkout_field[]'] = requiredCheckoutField;
    request.fields['rating'] = rating;
    request.fields['type'] = type;
    request.fields['country'] = country;
    request.fields['address'] = address;
    request.fields['description'] = description;
    request.fields['features'] = features;
    request.files.add(await http.MultipartFile.fromPath('photo', photo));
    request.files.add(await http.MultipartFile.fromPath('photo_2', photo));
    request.files.add(await http.MultipartFile.fromPath('photo_3', photo));
    request.files.add(await http.MultipartFile.fromPath('photo_4', photo));

    request.headers.addAll(headers);

    try {
      final streamedResponse = await request.send();
      print("streamedResponse: ${streamedResponse.statusCode}");
      var response = await http.Response.fromStream(streamedResponse);
      print("ressss: $response");
      print("ressss-body: ${response.body}");
      print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        print('Vendor creeated successfully!');
        return jsonDecode(response.body);
      } else {
        print('Error creating vendor. status-code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error creating vendor: $e');
    }
  }

  Future<dynamic> postVideoWithText(
    dynamic urlPath,
    Map<String, dynamic> body,
    String caption,
    File file,
  ) async {
    var url = Uri.parse(formater(urlPath));

    String? token = await storage.read(key: "token");

    var request = http.MultipartRequest('POST', url);
    Map<String, String> headers = {
      "content-type": "multipart/form-data",
      "Authorization": "Bearer $token"
    };

    request.fields['type'] = 'video';
    request.fields['caption'] = caption;
    request.files.add(await http.MultipartFile.fromPath('file_url', file.path));

    request.headers.addAll(headers);

    try {
      final streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print('videooooo  ${jsonDecode(response.body)}');

      if (response.statusCode == 200) {
        print('video uploaded successfully!');
        return jsonDecode(response.body);
      } else {
        print('Error uploading video. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading video: $e');
    }
  }
}

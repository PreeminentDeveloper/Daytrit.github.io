import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:daytrit/authentication/models/data_model/register_agent_model.dart';
import 'package:daytrit/authentication/models/data_model/register_model.dart';
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/utils/network_handler.dart';
import 'package:daytrit/utils/url_paths.dart';

class RegisterService {
  static registerUser(Map<String, dynamic> data) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler.postWithoutToken(
          AuthenticationUrls.register, data);
      decodedData = jsonDecode(response.body);
      return Success(data: registerModelFromJson(response.body));
    } on SocketException catch (_) {
      return SignUpFailure(message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return SignUpFailure(message: "Request Timeout.");
    } catch (e) {
      print("register user service error: $e");
      return SignUpFailure(message: "${decodedData?['message']}");
    }
  }

  static registerAgent(
      {required String firstName,
      required String lastName,
      dynamic phoneNumber,
      required String email,
      required String companyName,
      required String companyAddress,
      dynamic idNumber,
      required String password,
      required String idCardType,
      required File? idFile,
      required File? companyCertificateFile}) async {
    NetworkHandler networkHandler = NetworkHandler();
    Map<String, dynamic>? decodedData;

    try {
      var response = await networkHandler.postAlongWIthFileWithoutToken(
          urlPath: AuthenticationUrls.registerAgent,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          email: email,
          companyName: companyName,
          companyAddress: companyAddress,
          idNumber: idNumber,
          password: password,
          idCardType: idCardType,
          idFile: idFile,
          companyCertificateFile: companyCertificateFile);
      decodedData = jsonDecode(response.body);
      print("Response: Agent --> $response");
      return Success(data: registerAgentModelFromJson(response.body));
    } on SocketException catch (_) {
      return SignUpFailure(message: "Kindly, check your internet connection.");
    } on TimeoutException catch (_) {
      return SignUpFailure(message: "Request Timeout.");
    } catch (e) {
      print("register agent service error: $e");
      return SignUpFailure(message: "${decodedData?['message']}");
    }
  }
}

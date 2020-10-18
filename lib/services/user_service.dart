import 'package:covidtracer/models/Contacts.dart';
import 'package:covidtracer/models/api_response.dart';
import 'package:covidtracer/models/user_insert.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UserService {
  static const API = 'https://api.covitracer.com/v1';
  static const headers = {
    'x-api-key': 'KuGrjSkiYi5Gfh4uGr16t1ejqlUZjAru8Wf6c42Q',
    'accept': 'application/json',
    'content-type': 'application/json'
    //'Accept': 'application/json'
  };

//User Registration
  Future<APIResponse<bool>> userRegistration(UserManipulation item) async {
    return await http.post(API + '/users', headers: headers, body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

//OTP verification
  Future<APIResponse<bool>> otpVerification(String code, String phone, String clientid) async {
    return await http.put(API + '/users/$phone/otp?clientId=$clientid&code=$code', headers: headers).then((data) {
      if (data.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

//Upload Contacts
  Future<APIResponse<bool>> uploapContacts(List<Contacts> contacts, String address) async {
     return await http.post(API + '/contacts/$address', headers:headers, body: jsonEncode(contacts.map((i) => i.toJson()).toList())).then((data) {
   //return await http.post(API + '/$contacts/$address', headers:headers, body: Contacts.encondeToJson(contacts).toString()).then((data) {
      if (data.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
    
  }
  Future<APIResponse<bool>> getImage(String id) async {
    return await http.get(API + '/images/$id', headers: headers).then((data) {
      if (data.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}



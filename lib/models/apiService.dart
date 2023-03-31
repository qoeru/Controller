import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:controler_app/models/Car.dart';
import 'package:controler_app/models/User.dart';
import 'package:controler_app/models/TokenObtainPair.dart';
import 'package:controler_app/env.sample.dart';

class ApiService {
  ApiService();

  Future<bool> isLoggedIn(String phone, String password) async {
    try {
      var response = await http.post(Uri.parse(Env.baseUrl + Env.apiEndpoint),
          body: jsonEncode(<String, String>{
            'phone': phone,
            'password': password,
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}

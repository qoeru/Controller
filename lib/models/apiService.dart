import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:controler_app/models/Car.dart';
import 'package:controler_app/models/User.dart';
import 'package:controler_app/models/TokenObtainPair.dart';
import 'package:controler_app/env.sample.dart';

class ApiService {
  ApiService();

  void login(String phone, String password) async {
    log(phone);
    log(password);
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
        log('congratulations!');
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

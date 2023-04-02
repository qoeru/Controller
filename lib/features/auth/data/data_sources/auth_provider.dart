import 'dart:convert';

import 'package:controler_app/features/auth/data/models/token_obtain_pair.dart';
import 'package:http/http.dart' as http;
import 'package:controler_app/config/env.sample.dart';

class AuthProvider {
  AuthProvider();

  final String _url = Env.baseUrl + Env.apiEndpoint;

  Future<String> getAuthStatus(String password, String phoneNumber) async {
    TokenObtainPair tokenPair =
        TokenObtainPair(password: password, phone: phoneNumber);
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode(tokenPair.toJson()),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    return response.statusCode.toString();
  }
}

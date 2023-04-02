import 'dart:convert';

import 'package:controler_app/domain/models/token_obtain_pair.dart';
import 'package:http/http.dart' as http;
import 'package:controler_app/data/env.sample.dart';
import 'package:controler_app/domain/models/user.dart';

class AuthProvider {
  AuthProvider();

  final String _tokenUrl = Env.baseUrl + Env.apiTokenEndpoint;
  final String _usersUrl =
      Env.baseUrl + Env.apiAdminPanelEndpoint + Env.apiUsersEndpoint;

  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

  Future<int> getAuthStatus(String password, String phoneNumber) async {
    TokenObtainPair tokenPair =
        TokenObtainPair(password: password, phone: phoneNumber);
    final response = await http.post(
      Uri.parse(_tokenUrl),
      body: jsonEncode(tokenPair.toJson()),
      headers: headers,
    );
    return response.statusCode;
  }

  Future<User> getUser(String phoneNumber) async {
    final response = await http.get(
      Uri.parse(_usersUrl),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);
      for (final user in users) {
        if (user['phoneNumber'] == phoneNumber) {
          return User.fromJson(user);
        }
      }
    }
    throw Exception('User not found');
  }
}

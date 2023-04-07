import 'package:controler_app/domain/models/token_obtain_pair.dart';
import 'package:controler_app/data/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUtil {
  void login(
      TokenObtainPair tokenPair, BuildContext context, Widget page) async {
    AuthProvider authProvider = AuthProvider();
    int statusCode = await authProvider.getAuthStatus(
        tokenPair.password.toString(), tokenPair.phone.toString());
    if (statusCode == 200 || statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogged', true);
    }
  }
}

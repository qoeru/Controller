import 'package:controler_app/features/auth/data/data_sources/auth_provider.dart';

void handleSignIn(String phoneNumber, String password) async {
  AuthProvider authProvider = AuthProvider();
  String statusCode = await authProvider.getAuthStatus(password, phoneNumber);

  if (statusCode == 404)
  {
    return
  }
}

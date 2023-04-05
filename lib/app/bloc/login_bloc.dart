import 'package:bloc/bloc.dart';
import 'package:controler_app/domain/models/token_obtain_pair.dart';
import 'package:meta/meta.dart';
import 'package:controler_app/data/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

// enum AuthState { loggedIn, loggedOut, loading }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginUninitialized()) {
    AuthProvider authProvider = AuthProvider();

    on<LoggingIn>((event, emit) async {
      int statusCode = await authProvider.getAuthStatus(
          event.tokenPair.password.toString(),
          event.tokenPair.phone.toString());
      if (statusCode != 200 && statusCode != 201) {
        emit(LoginUnauthenticated());
      } else {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLogged', true);
        emit(LoginAuthenticated());
      }
    });

    on<AppStarted>((event, emit) async {});

    on<LoggingOut>((event, emit) async {} // TODO: implement event handler
        );

    // on<LoginLoading> (
    //  (event, emit) async {}
    // );
  }
}

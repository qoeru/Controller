part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  // final String password;
  // final String phoneNumber;

  // LoginState({required this.phoneNumber, this.password});
}

class LoginUninitialized extends LoginState {}

class LoginAuthenticated extends LoginState {
  final User user;

  LoginAuthenticated({required this.user});
}

class LoginUnauthenticated extends LoginState {}

class LoginLoading extends LoginState {}

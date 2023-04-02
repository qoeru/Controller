part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  // final String password;
  // final String phoneNumber;

  // LoginState({required this.phoneNumber, this.password});
}

class LoginUninitialized extends LoginState {
  @override
  String toString() => 'LoginUninitialized';
}

class LoginAuthenticated extends LoginState {
  @override
  String toString() => 'LoginAuthenticated';
}

class LoginUnauthenticated extends LoginState {
  @override
  String toString() => 'LoginUnauthenticated';
}

class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';
}

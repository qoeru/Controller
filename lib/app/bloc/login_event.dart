part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class AppStarted extends LoginEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggingIn extends LoginEvent {
  final TokenObtainPair tokenPair;

  LoggingIn({required this.tokenPair});

  @override
  String toString() => 'LoggedIn';
}

class LoggingOut extends LoginEvent {
  @override
  String toString() => 'LoggedOut';
}

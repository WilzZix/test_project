import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginEvent {}

class TryToLoginEvent extends LoginEvent {
  final String email;
  final String password;

  TryToLoginEvent(this.email, this.password);
}

class CheckLoggedInStateEvent extends LoginEvent {}

class LogOutEvent extends LoginEvent {}

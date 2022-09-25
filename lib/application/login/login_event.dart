import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginEvent {}

class TryToLoginEvent extends LoginEvent {
  final String phone;
  final String password;

  TryToLoginEvent(this.phone, this.password);
}

class CheckLoggedInStateEvent extends LoginEvent {}

class LogOutEvent extends LoginEvent {}

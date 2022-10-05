part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoggedInState extends LoginState {}

class GoHomeScreenState extends LoginState{}

class LoggingInErrorState extends LoginState {}

class NotLoggedInState extends LoginState {}

class LogOutState extends LoginState {}

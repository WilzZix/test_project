part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class UserRegistrationLoadingState extends RegistrationState {}

class UserRegistrationCompleteState extends RegistrationState {}

class UserRegistrationErrorState extends RegistrationState {}

class WeakPasswordState extends RegistrationState {
  final String? message;

  WeakPasswordState(this.message);
}

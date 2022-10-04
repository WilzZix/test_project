part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class UserRegisterEvent extends RegistrationEvent {
  final String email;
  final String password;
  final String name;

  UserRegisterEvent(this.email, this.password, this.name);
}
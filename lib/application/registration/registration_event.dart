part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class UserRegisterEvent extends RegistrationEvent {
  final String phone;
  final String password;
  final String name;

  UserRegisterEvent(this.phone, this.password, this.name);
}
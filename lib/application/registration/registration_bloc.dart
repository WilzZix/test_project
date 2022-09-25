import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<UserRegisterEvent>((event, emit) async {
      emit(UserRegistrationLoadingState());
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('phone', '${event.phone}');
        prefs.setString('password', '${event.password}');
        prefs.setString('name', '${event.name}');
        emit(UserRegistrationCompleteState());
      } catch (e) {
        emit(UserRegistrationErrorState());
        print(e);
      }
    });
  }
}

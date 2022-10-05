import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<UserRegisterEvent>((event, emit) async {
      emit(UserRegistrationLoadingState());
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(UserRegistrationCompleteState());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(WeakPasswordState(e.message));
        } else if (e.code == 'email-already-in-use') {
          emit(WeakPasswordState(e.message));
        }
      } catch (e) {
        emit(UserRegistrationErrorState());
      }
    });
  }
}

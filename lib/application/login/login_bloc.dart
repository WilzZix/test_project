import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<TryToLoginEvent>((event, emit) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: event.email, password: event.password);
        print(userCredential);
        if (userCredential.user != null) {
          emit(LoggedInState());
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      } catch (e) {
        print(e);
      }
    });
    on<CheckLoggedInStateEvent>(
      (event, emit) async {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          emit(LoggedInState());
        } else {
          emit(NotLoggedInState());
        }
      },
    );
    on<LogOutEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('authStatus', 'notLoggedIn');
      emit(LogOutState());
    });
  }
}

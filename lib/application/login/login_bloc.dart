import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<TryToLoginEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String phone = prefs.getString('phone').toString();
      String password = prefs.getString('password').toString();
      print('PHONE AND PASSWORD ${phone}  ${password}');
      if (phone.compareTo(event.phone) == 1 && password.compareTo(event.password) == 1) {

        prefs.setString('authStatus', 'loggedIn');
        print('PHONE AND PASSWORD true');
        emit(LoggedInState());
      } else {
        print('PHONE AND PASSWORD false');
        prefs.setString('authStatus', 'notLoggedIn');
        emit(LoggingInErrorState());
      }
    });
    on<CheckLoggedInStateEvent>(
      (event, emit) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String authStatus = prefs.getString('authStatus').toString();
        if (authStatus == 'loggedIn') {
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

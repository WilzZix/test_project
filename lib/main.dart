import 'package:flutter/material.dart';
import 'package:test_project/application/login/login_event.dart';
import 'package:test_project/screens/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/screens/splash_screen/splash_screen.dart';
import 'package:test_project/screens/table_page/table_page.dart';
import 'application/login/login_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    BlocProvider<LoginBloc>(
      create: (context) => LoginBloc()..add(CheckLoggedInStateEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoggedInState) {
              return const TablePage();
            } else if (state is LoginLoadingState) {
              return const SplashScreen();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    ),
  );
}

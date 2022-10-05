import 'package:flutter/material.dart';
import 'package:test_project/application/login/login_event.dart';
import 'package:test_project/screens/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/screens/table_page/table_page.dart';
import 'application/login/login_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(
    BlocProvider<LoginBloc>(
      create: (context) => LoginBloc()..add(CheckLoggedInStateEvent()),
      child: MaterialApp(
        home: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoggedInState) {
              return const TablePage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    ),
  );
}

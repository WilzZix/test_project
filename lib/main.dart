import 'package:flutter/material.dart';
import 'package:test_project/application/login/login_event.dart';
import 'package:test_project/screens/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/screens/table_page/table_page.dart';
import 'application/login/login_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: BlocBuilder<LoginBloc, LoginState>(
        bloc: LoginBloc()..add(CheckLoggedInStateEvent()),
        builder: (context, state) {
          if (state is LoggedInState) {
            return const TablePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    ),
  );
}

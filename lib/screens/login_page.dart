import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_project/application/login/login_bloc.dart';
import 'package:test_project/application/login/login_event.dart';
import 'package:test_project/screens/registration_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF203C7C),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF203C7C),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xFF203C7C),
                        height: MediaQuery.of(context).size.height * 0.30,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                radius: 40,
                                child: const Icon(
                                  Icons.person,
                                  size: 50,
                                ),
                              ),
                              const Text(
                                'Вход',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                onChanged: (value) {
                                  email = value;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'Введите свой email',
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 3,
                                    ),
                                  ),
                                  prefixIcon: IconTheme(
                                    data: IconThemeData(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    child: const Icon(Icons.email),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                onChanged: (value) {
                                  password = value;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Введите пароль',
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 3,
                                    ),
                                  ),
                                  prefixIcon: IconTheme(
                                    data: IconThemeData(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    child: const Icon(Icons.lock),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Checkbox(checkColor: const Color(0xFF203C7C), value: false, onChanged: (value) {}),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    'Запомнить меня',
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              BlocProvider(
                                create: (context) => LoginBloc(),
                                child: BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    print('LOGIN PAGE STATE $state');
                                    return GestureDetector(
                                      onTap: () {
                                        LoginBloc().add(TryToLoginEvent(email, password));
                                        // if (state is LoggedInState) {
                                        //   Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) => const RegistrationPage(),
                                        //     ),
                                        //   );
                                        // }
                                        if (state is LoggingInErrorState) {
                                          const SnackBar(
                                            content: Text('Попробуйте зарегистрироваться'),
                                          );
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF203C7C),
                                          borderRadius: BorderRadius.circular(14),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Войти',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              RichText(
                                text: TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const RegistrationPage(),
                                        ),
                                      );
                                    },
                                  text: 'Если у вас нет аккаунта',
                                  style: const TextStyle(
                                    color: Color(0xFF203C7C),
                                  ),
                                ),
                              ),
                              const Center(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

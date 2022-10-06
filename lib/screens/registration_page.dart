import 'package:flutter/material.dart';
import 'package:test_project/screens/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../application/registration/registration_bloc.dart';
import 'package:flutter/gestures.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String email = '', name = '', password = '';
  bool loading = false;

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
                                'Регистрация',
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
                                  name = value;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: 'Введите свой имя',
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
                                    child: const Icon(Icons.person),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
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
                              BlocProvider(
                                create: (context) => RegistrationBloc(),
                                child: BlocBuilder<RegistrationBloc, RegistrationState>(
                                  builder: (context, state) {
                                    return GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<RegistrationBloc>(context).add(UserRegisterEvent(email, password, name));
                                        if (state is WeakPasswordState) {
                                          loading = false;
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(state.message!),
                                            ),
                                          );
                                        }
                                        if (state is UserRegistrationCompleteState) {
                                          loading = false;
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const LoginPage(),
                                            ),
                                          );
                                        }
                                        if (state is UserRegistrationLoadingState) {
                                          loading = true;
                                        }
                                        if (state is UserRegistrationErrorState) {
                                          loading = false;
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
                                        child: Center(
                                          child: loading
                                              ? const CircularProgressIndicator()
                                              : const Text(
                                                  'Зарегистрироваться',
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
                                          builder: (context) => const LoginPage(),
                                        ),
                                      );
                                    },
                                  text: 'У меня уже есть аккаунт',
                                  style: const TextStyle(
                                    color: Color(0xFF203C7C),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
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

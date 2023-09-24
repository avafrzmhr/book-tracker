import '/data/datasource/api_handler.dart';
import '/data/repositories/auth_repo.dart';
import '/peresentation/blocs/loginBloc/login_bloc.dart';
import '/peresentation/blocs/loginBloc/login_event.dart';
import '/peresentation/blocs/loginBloc/login_state.dart';
import '/peresentation/blocs/registerBloc/register_bloc.dart';
import '/peresentation/blocs/registerBloc/register_event.dart';
import '/peresentation/prefs.dart';
import '/peresentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/registerBloc/register_state.dart';
import 'textfield.dart';

class AuthForm extends StatefulWidget {
  BoxConstraints constraints;

  AuthForm(
    this.constraints,
  );

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  var _isLogin = true;

  @override
  Widget build(BuildContext context) {
    context.read<TokenProvider>().init(context);
    ApiHandler apiHandler;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => RegisterBloc(AuthRepositoryImp(ApiHandler()))),
        BlocProvider(
            create: (context) => LoginBloc(AuthRepositoryImp(ApiHandler()))),
      ],
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.bottomRight,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              height: widget.constraints.maxHeight * 0.37,
              width: widget.constraints.maxWidth * 0.63,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(300),
                ),
                color: Color.fromARGB(86, 128, 158, 248),
              ),
            ),
          ),
          Container(
            width: widget.constraints.maxWidth * 0.37,
            height: widget.constraints.maxHeight * 0.2,
            decoration: const BoxDecoration(
              color: Color.fromARGB(86, 128, 158, 248),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(140),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: widget.constraints.maxHeight * 0.2,
                ),
                Text(
                  _isLogin ? 'Log in' : 'Create Account',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: widget.constraints.maxHeight * 0.08,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthTextField(
                        'Username',
                        usernameController,
                        widget.constraints,
                        (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Username must be at least 4 characters long';
                          }
                          return null;
                        },
                      ),
                      AuthTextField(
                        'Password',
                        passwordController1,
                        widget.constraints,
                        (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Password must be at least 7 characters long';
                          }
                          return null;
                        },
                      ),
                      if (!_isLogin)
                        AuthTextField(
                          'Repeat password',
                          passwordController2,
                          widget.constraints,
                          (value) {
                            if (value!.isEmpty ||
                                passwordController2 != passwordController1) {
                              return 'Passwords are not equal';
                            }
                            return null;
                          },
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      MultiBlocListener(
                        listeners: [
                          BlocListener<RegisterBloc, RegisterState>(
                            listener: (context, state) {
                              if (state is RegisterSuccess) {
                                Navigator.of(context)
                                    .pushNamed(TabsScreen.routeName);
                              }
                            },
                          ),
                          BlocListener<LoginBloc, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccess) {
                                Navigator.of(context)
                                    .pushNamed(TabsScreen.routeName);
                              }
                            },
                          ),
                        ],
                        child: BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                elevation: 0,
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 23, 105),
                              ),
                              onPressed: () {
                                !_isLogin
                                    ? BlocProvider.of<RegisterBloc>(context)
                                        .add(SubmitRegisterEvent(
                                        usernameController.text,
                                        passwordController1.text,
                                        passwordController2.text,
                                      ))
                                    : BlocProvider.of<LoginBloc>(context)
                                        .add(SubmitLoginEvent(
                                        usernameController.text,
                                        passwordController1.text,
                                      ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 30,
                                ),
                                child: Text(
                                  _isLogin ? 'Log in' : 'Signup',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _isLogin
                                  ? 'Don\'t have an account?'
                                  : 'Already have an account?',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              _isLogin ? 'Signup' : 'Log in',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 37, 173),
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

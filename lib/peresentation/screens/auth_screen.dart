import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/authform.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: AuthForm(
            constraints,
          ));
    });
  }
}

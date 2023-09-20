import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  String labelText;
  BoxConstraints constraints;
  TextEditingController controller;

  String? Function(String?)? validator;

  AuthTextField(
    this.labelText,
    this.controller,
    this.constraints,
    this.validator,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: constraints.maxWidth * 0.1,
        right: constraints.maxWidth * 0.1,
        bottom: constraints.maxHeight * 0.04,
      ),
      child: Container(
        width: constraints.maxWidth * 0.7,
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: labelText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 2,
                color: Color.fromARGB(255, 209, 207, 203),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 2,
                color: Color.fromARGB(255, 209, 207, 203),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

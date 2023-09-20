import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class SubmitRegisterEvent extends RegisterEvent {
  String username;
  String password1;
  String password2;

  SubmitRegisterEvent(this.username, this.password1, this.password2);

  @override
  List<Object?> get props => [username, password1, password2];
}

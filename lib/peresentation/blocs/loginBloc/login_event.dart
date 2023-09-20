import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SubmitLoginEvent extends LoginEvent {
  String username;
  String password;

  SubmitLoginEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

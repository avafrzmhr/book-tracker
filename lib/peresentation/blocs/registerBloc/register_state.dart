import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterEmpty extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterErrorState extends RegisterState {
  final String error;
  RegisterErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

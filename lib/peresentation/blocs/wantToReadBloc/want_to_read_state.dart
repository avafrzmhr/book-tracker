import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/book.dart';

@immutable
abstract class WantToReadState extends Equatable {}

class WantToReadInitial extends WantToReadState {
  @override
  List<Object?> get props => [];
}

class WantToReadSuccess extends WantToReadState {
  List<Books> books;

  WantToReadSuccess(this.books);
  @override
  List<Object?> get props => [books];
}

class WantToReadEmpty extends WantToReadState {
  @override
  List<Object?> get props => [];
}

class WantToReadErrorState extends WantToReadState {
  final String error;
  WantToReadErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

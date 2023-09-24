import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/book.dart';

@immutable
abstract class ReadState extends Equatable {}

class ReadInitial extends ReadState {
  @override
  List<Object?> get props => [];
}

class ReadSuccess extends ReadState {
  List<Books> books;

  ReadSuccess(this.books);
  @override
  List<Object?> get props => [books];
}

class ReadEmpty extends ReadState {
  @override
  List<Object?> get props => [];
}

class ReadErrorState extends ReadState {
  final String error;
  ReadErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

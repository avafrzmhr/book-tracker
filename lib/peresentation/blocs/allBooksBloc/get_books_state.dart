import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/book.dart';

@immutable
abstract class GetBooksState extends Equatable {}

class GetBooksInitial extends GetBooksState {
  @override
  List<Object?> get props => [];
}

class GetBooksSuccess extends GetBooksState {
  List<Books> books;

  GetBooksSuccess(this.books);
  @override
  List<Object?> get props => [books];
}

class GetBooksEmpty extends GetBooksState {
  @override
  List<Object?> get props => [];
}

class GetBooksErrorState extends GetBooksState {
  final String error;
  GetBooksErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

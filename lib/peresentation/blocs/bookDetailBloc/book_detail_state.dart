import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/book.dart';

@immutable
abstract class BookDetailState extends Equatable {}

class BookDetailInitial extends BookDetailState {
  @override
  List<Object?> get props => [];
}

class BookDetailSuccess extends BookDetailState {
  Books books;

  BookDetailSuccess(this.books);
  @override
  List<Object?> get props => [books];
}

class BookDetailEmpty extends BookDetailState {
  @override
  List<Object?> get props => [];
}

class BookDetailErrorState extends BookDetailState {
  final String error;
  BookDetailErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

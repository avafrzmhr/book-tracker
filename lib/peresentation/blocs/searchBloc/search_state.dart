import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/book.dart';

@immutable
abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchSuccess extends SearchState {
  List<Books> books;
  SearchSuccess(this.books);
  @override
  List<Object?> get props => [books];
}

class SearchEmpty extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchErrorState extends SearchState {
  final String error;
  SearchErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

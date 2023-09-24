import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/book.dart';

@immutable
abstract class CurrentlyReadState extends Equatable {}

class CurrentlyReadInitial extends CurrentlyReadState {
  @override
  List<Object?> get props => [];
}

class CurrentlyReadSuccess extends CurrentlyReadState {
  List<Books> books;

  CurrentlyReadSuccess(this.books);
  @override
  List<Object?> get props => [books];
}

class CurrentlyReadEmpty extends CurrentlyReadState {
  @override
  List<Object?> get props => [];
}

class CurrentlyReadErrorState extends CurrentlyReadState {
  final String error;
  CurrentlyReadErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

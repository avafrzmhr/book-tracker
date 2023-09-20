import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SubmitSearchEvent extends SearchEvent {
  String searchKey;
  SubmitSearchEvent(this.searchKey);

  @override
  List<Object?> get props => [searchKey];
}

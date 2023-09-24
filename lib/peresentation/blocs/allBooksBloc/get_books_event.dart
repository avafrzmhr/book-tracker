import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetBooksEvent extends Equatable {
  const GetBooksEvent();
}

class SubmitGetBooksEvent extends GetBooksEvent {
  SubmitGetBooksEvent();

  @override
  List<Object?> get props => [];
}

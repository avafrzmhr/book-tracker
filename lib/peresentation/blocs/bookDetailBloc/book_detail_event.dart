import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BookEvent extends Equatable {
  const BookEvent();
}

class SubmitBookEvent extends BookEvent {
  int id;

  SubmitBookEvent(this.id);

  @override
  List<Object?> get props => [id];
}

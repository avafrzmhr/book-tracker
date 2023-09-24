import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ReadEvent extends Equatable {
  const ReadEvent();
}

class SubmitReadEvent extends ReadEvent {
  @override
  List<Object?> get props => [];
}

class AddReadEvent extends ReadEvent {
  List<int> id;
  AddReadEvent(this.id);
   @override
  List<Object?> get props => [id];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class WantToReadEvent extends Equatable {
  const WantToReadEvent();
}

class SubmitWantToReadEvent extends WantToReadEvent {
  @override
  List<Object?> get props => [];
}
class AddWantToReadEvent extends WantToReadEvent {
  List<int> id;
  AddWantToReadEvent(this.id);
   @override
  List<Object?> get props => [id];
}

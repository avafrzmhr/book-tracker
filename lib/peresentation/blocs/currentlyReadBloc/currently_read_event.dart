import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CurrentlyReadEvent extends Equatable {
  const CurrentlyReadEvent();
}

class SubmitCurrentlyReadEvent extends CurrentlyReadEvent {
  @override
  List<Object?> get props => [];
}
class AddCurrentlyReadEvent extends CurrentlyReadEvent {
  List<int> id;
  AddCurrentlyReadEvent(this.id);
   @override
  List<Object?> get props => [id];
}

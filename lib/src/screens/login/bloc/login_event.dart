import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnLoginButtonPressedEvent extends LoginEvent {
  @override
  String toString() => "OnLoginButtonPressedEvent";
}

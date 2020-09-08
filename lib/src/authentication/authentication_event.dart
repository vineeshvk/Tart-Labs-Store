import 'package:equatable/equatable.dart';

class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthenticationEvent {
  @override
  String toString() => "AppStartedEvent";
}

class AuthenticationLoggedInEvent extends AuthenticationEvent {
  @override
  String toString() => 'AuthenticationLoggedInEvent';
}

class AuthenticationLoggedOutEvent extends AuthenticationEvent {
  @override
  String toString() => "AuthenticationLoggedOutEvent";
}

import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}


class AuthenticationInitialState extends AuthenticationState {
  @override
  String toString() => "AuthenticationInitialState";
}

class AuthenticationLoggedInState extends AuthenticationState {
  @override
  String toString() => "AuthenticationLoggedInState";
}

class AuthenticationLoggedOutState extends AuthenticationState {
  @override
  String toString() => "AuthenticationLoggedOutState";
}
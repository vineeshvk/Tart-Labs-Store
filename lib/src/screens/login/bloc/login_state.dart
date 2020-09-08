import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {
  @override
  String toString() => "LoginInitialState";
}

class LoginLoadingState extends LoginState {
  @override
  String toString() => "LoginLoadingState";
}

class LoginSuccessState extends LoginState {
  @override
  String toString() => "LoginSuccessState";
}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState(this.error);

  @override
  String toString() => "LoginFailureState";
}

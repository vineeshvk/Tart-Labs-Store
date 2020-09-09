import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabsstore/src/authentication/authentication_bloc.dart';
import 'package:tartlabsstore/src/authentication/authentication_event.dart';
import 'package:tartlabsstore/src/repositories/login_repository.dart';
import 'package:tartlabsstore/src/responses/auth_response.dart';
import 'package:tartlabsstore/src/screens/login/bloc/login_event.dart';
import 'package:tartlabsstore/src/screens/login/bloc/login_state.dart';
import 'package:tartlabsstore/src/utils/preference_helper.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/utils/validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthenticationBloc _authenticationBloc;

  LoginBloc(this._authenticationBloc) : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is OnLoginButtonPressedEvent) {
      try {
        yield LoginLoadingState();
        var state = Validator.validate(emailController.text, rules: ["email"]);

        if (!state.status) {
          yield LoginFailureState(
            StringResources.emailText + " " + state.error,
          );
          return;
        }

        state = Validator.validate(
          passwordController.text,
          rules: ["required", "min:8"],
        );

        if (!state.status) {
          yield LoginFailureState(
            StringResources.passwordText + " " + state.error,
          );
          return;
        }
        AuthResponse res = await LoginRepository.login(
          email: emailController.text,
          password: passwordController.text,
        );

        if (res.accessToken != null) {
          PreferenceHelper.saveToken(res.getToken());
          _authenticationBloc.add(AuthenticationLoggedInEvent());
          yield LoginSuccessState();
        } else {
          yield LoginFailureState("Login fail");
        }
      } catch (e) {
        yield LoginFailureState(e.toString());
      }
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}

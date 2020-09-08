import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabsstore/src/authentication/authentication_event.dart';
import 'package:tartlabsstore/src/authentication/authentication_state.dart';
import 'package:tartlabsstore/src/utils/preference_helper.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStartedEvent) {
      final token = await PreferenceHelper.getToken();

      if (token != null)
        yield AuthenticationLoggedInState();
      else
        yield AuthenticationLoggedOutState();
    }

    if (event is AuthenticationLoggedInEvent) {
      yield AuthenticationLoggedInState();
    }

    if (event is AuthenticationLoggedOutEvent) {
      await PreferenceHelper.removeToken();
      yield AuthenticationLoggedOutState();
    }
  }
}

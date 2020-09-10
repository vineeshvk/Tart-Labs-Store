import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:tartlabsstore/src/app.dart';
import 'package:tartlabsstore/src/authentication/authentication_bloc.dart';
import 'package:tartlabsstore/src/authentication/authentication_event.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Cubit bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

main() async {
  Bloc.observer = AppBlocObserver();
  await FlutterDownloader.initialize(debug: true);

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc()..add(AppStartedEvent());
      },
      child: App(),
    ),
  );
}

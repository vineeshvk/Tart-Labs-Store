import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabsstore/src/authentication/authentication_bloc.dart';
import 'package:tartlabsstore/src/authentication/authentication_state.dart';
import 'package:tartlabsstore/src/models/app_model.dart';
import 'package:tartlabsstore/src/screens/app-details/app_details_screen.dart';
import 'package:tartlabsstore/src/screens/home/bloc/app_store_bloc.dart';
import 'package:tartlabsstore/src/screens/home/home_screen.dart';
import 'package:tartlabsstore/src/screens/login/bloc/login_bloc.dart';
import 'package:tartlabsstore/src/screens/login/login_screen.dart';
import 'package:tartlabsstore/src/screens/previous-app/previous_app_screen.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return PageRoutes.buildLoginScreen();
    case HomeScreen.routeName:
      return PageRoutes.buildHomeScreen();
    case AppDetailsScreen.routeName:
      final AppDetailsScreenArguments args = settings.arguments;
      return PageRoutes.buildAppDetailsScreen(args.appDetail);
    case PreviousAppScreen.routeName:
      final PreviousAppScreenArguments args = settings.arguments;
      return PageRoutes.buildPreviousAppScreen(args.appDetail);

    default:
      return null;
  }
}

class PageBuilder {
  static Widget buildLoginScreenPage() {
    return BlocProvider<LoginBloc>(
      create: (context) {
        return LoginBloc(BlocProvider.of<AuthenticationBloc>(context));
      },
      child: LoginScreen(),
    );
  }

  static Widget buildHomeScreenPage() {
    return BlocProvider<AppStoreBloc>(
      create: (context) {
        return AppStoreBloc();
      },
      child: HomeScreen(),
    );
  }

  static Widget buildAppDetailsScreenPage(AppModel appDetail) {
    return AppDetailsScreen(appDetail: appDetail);
  }

  static Widget buildPreviousAppScreenPage(AppModel appDetail) {
    return PreviousAppScreen(appDetail: appDetail);
  }
}

class PageRoutes {
  static MaterialPageRoute buildLoginScreen() {
    return MaterialPageRoute(
      builder: (context) => addAuthBloc(
        context,
        PageBuilder.buildLoginScreenPage(),
      ),
    );
  }

  static MaterialPageRoute buildHomeScreen() {
    return MaterialPageRoute(
      builder: (context) => addAuthBloc(
        context,
        PageBuilder.buildHomeScreenPage(),
      ),
    );
  }

  static MaterialPageRoute buildAppDetailsScreen(AppModel appDetail) {
    return MaterialPageRoute(
      builder: (context) => addAuthBloc(
        context,
        PageBuilder.buildAppDetailsScreenPage(appDetail),
      ),
    );
  }

  static MaterialPageRoute buildPreviousAppScreen(AppModel appDetail) {
    return MaterialPageRoute(
      builder: (context) => addAuthBloc(
        context,
        PageBuilder.buildPreviousAppScreenPage(appDetail),
      ),
    );
  }
}

Widget addAuthBloc(BuildContext context, Widget widget) {
  return BlocListener(
    cubit: BlocProvider.of<AuthenticationBloc>(context),
    listener: (context, state) {
      if (state is AuthenticationLoggedInState) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (v) => false);
      }
      if (state is AuthenticationLoggedOutState) {
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.routeName, (v) => false);
      }
    },
    child: BlocBuilder(
      cubit: BlocProvider.of<AuthenticationBloc>(context),
      builder: (context, state) {
        return widget;
      },
    ),
  );
}

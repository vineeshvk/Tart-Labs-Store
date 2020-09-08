import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabsstore/src/screens/login/bloc/login_bloc.dart';
import 'package:tartlabsstore/src/screens/login/bloc/login_event.dart';
import 'package:tartlabsstore/src/utils/image_resources.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/widgets/input_field.dart';
import 'package:tartlabsstore/src/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  _signInOnPressed() {
    _loginBloc.add(OnLoginButtonPressedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageResources.loginBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageResources.tartlabsLogoImage),
            Container(margin: EdgeInsets.only(top: 40)),
            InputField(
              label: StringResources.emailText,
              icon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
              controller: _loginBloc.emailController,
            ),
            Container(margin: EdgeInsets.only(top: 8)),
            InputField(
              label: StringResources.passwordText,
              icon: Icons.more_horiz,
              obscureText: true,
              controller: _loginBloc.passwordController,
            ),
            Container(margin: EdgeInsets.only(top: 30)),
            PrimaryButton(
              label: StringResources.signInText,
              onPressed: _signInOnPressed,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.emailController.dispose();
    _loginBloc.passwordController.dispose();
    _loginBloc.close();

    super.dispose();
  }
}

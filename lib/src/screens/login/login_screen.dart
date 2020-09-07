import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/screens/home/home_screen.dart';
import 'package:tartlabsstore/src/utils/image_resources.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/widgets/input_field.dart';
import 'package:tartlabsstore/src/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _signInOnPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
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
            ),
            Container(margin: EdgeInsets.only(top: 8)),
            InputField(
              label: StringResources.passwordText,
              icon: Icons.more_horiz,
              obscureText: true,
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
}

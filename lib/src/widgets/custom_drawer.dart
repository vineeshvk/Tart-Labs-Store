import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabsstore/src/authentication/authentication_bloc.dart';
import 'package:tartlabsstore/src/authentication/authentication_event.dart';
import 'package:tartlabsstore/src/utils/color_resources.dart';
import 'package:tartlabsstore/src/utils/image_resources.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/widgets/custom_text.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  void _onMyAppSelected() {
    Navigator.pop(context);
  }

  void _onLogoutSelected() {
    _authenticationBloc.add(AuthenticationLoggedOutEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          getDrawerHeaderWidget(),
          getListTileWidget(
            StringResources.myAppsText,
            Icons.layers,
            selected: true,
            onTap: _onMyAppSelected,
          ),
          getListTileWidget(
            StringResources.logoutText,
            Icons.keyboard_tab,
            onTap: _onLogoutSelected,
          )
        ],
      ),
    );
  }

  Widget getDrawerHeaderWidget() {
    return Container(
      height: 300,
      width: double.infinity,
      child: DrawerHeader(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              ImageResources.tartlabsLogoImage,
              height: 150,
            ),
            CustomText(
              StringResources.tempUserText,
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              ImageResources.loginBackgroundImage,
            ),
          ),
        ),
      ),
    );
  }

  Widget getListTileWidget(
    String text,
    IconData icon, {
    void Function() onTap,
    bool selected = false,
  }) {
    return ListTile(
      onTap: onTap,
      selected: selected,
      leading: Icon(icon, color: selected ? Colors.white : null),
      selectedTileColor: selected ? ColorResources.FADED_RED : null,
      title: CustomText(
        text,
        fontWeight: FontWeight.bold,
        color: selected ? Colors.white : null,
      ),
    );
  }

  @override
  void dispose() {
    _authenticationBloc.close();
    super.dispose();
  }
}

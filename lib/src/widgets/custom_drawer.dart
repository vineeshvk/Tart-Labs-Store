import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/screens/login/login_screen.dart';
import 'package:tartlabsstore/src/utils/colors.dart';
import 'package:tartlabsstore/src/utils/image_resources.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  void _onMyAppSelected() {
    Navigator.pop(context);
  }

  void _onLogoutSelected() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
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
            Text(
              StringResources.tempUserText,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
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
      selectedTileColor: selected ? ProjectColors.fadedRed : null,
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: selected ? Colors.white : null,
        ),
      ),
    );
  }
}

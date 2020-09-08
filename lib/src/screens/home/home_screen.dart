import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/screens/app-details/app_details_screen.dart';
import 'package:tartlabsstore/src/utils/image_resources.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/widgets/app_display_card.dart';
import 'package:tartlabsstore/src/widgets/custom_appbar.dart';
import 'package:tartlabsstore/src/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onAppTilePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AppDetailsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        title: Image.asset(
          ImageResources.tartlabsStoreAppBarImage,
          width: 146,
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        itemCount: 3,
        separatorBuilder: (context, index) => Container(height: 10),
        itemBuilder: (context, index) {
          return AppDisplayCard(
            imageUrl: ImageResources.tempAppImage,
            title: StringResources.tempAppTitleText,
            date: StringResources.tempDateText,
            onTap: _onAppTilePressed,
          );
        },
      ),
    );
  }
}

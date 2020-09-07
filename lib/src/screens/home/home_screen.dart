import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/utils/image_resources.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/widgets/custom_appbar.dart';
import 'package:tartlabsstore/src/widgets/custom_drawer.dart';
import 'package:tartlabsstore/src/widgets/display_card.dart';

class HomeScreen extends StatelessWidget {
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
          return DisplayCard(
            imageUrl: ImageResources.storeAppImage,
            title: StringResources.titleText,
            date: StringResources.dateText,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/utils/image_resources.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/widgets/app_display_card.dart';
import 'package:tartlabsstore/src/widgets/custom_appbar.dart';
import 'package:tartlabsstore/src/widgets/version_display_card.dart';

class PreviousAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: change font family
      appBar: CustomAppBar(
        title: Text(
          StringResources.tempAppTitleText,
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            AppDisplayCard(
              imageUrl: ImageResources.tempAppImage,
              title: StringResources.tempAppTitleText,
              date: StringResources.tempDateText,
              isSelectable: false,
            ),
            Container(margin: EdgeInsets.only(top: 10)),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (context, index) => Container(height: 10),
                itemBuilder: (context, index) {
                  return VersionDisplayCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

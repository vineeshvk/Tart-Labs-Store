import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/screens/previous-app/previous_app_screen.dart';
import 'package:tartlabsstore/src/utils/colors.dart';
import 'package:tartlabsstore/src/utils/image_resources.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/widgets/custom_appbar.dart';
import 'package:tartlabsstore/src/widgets/primary_button.dart';

class AppDetailsScreen extends StatefulWidget {
  @override
  _AppDetailsScreenState createState() => _AppDetailsScreenState();
}

class _AppDetailsScreenState extends State<AppDetailsScreen> {
  void _onInstallButtonPressed() {}

  void _onShareButtonPressed() {}

  void _onViewOldBuildButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PreviousAppScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          StringResources.tempAppTitleText,
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 2),
              color: Colors.black.withOpacity(0.2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getAppDisplayWidget(),
            getSharebleLinkWidget(),
            getAppDescriptionWidget(),
            getWhatsNewWidget(),
            getViewOlderBuildWidget()
          ],
        ),
      ),
    );
  }

  Widget getAppDisplayWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            ImageResources.tempAppImage,
            width: 67,
            height: 67,
          ),
          Container(margin: EdgeInsets.only(left: 10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringResources.tempAppTitleText,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  StringResources.tempDateText,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PrimaryButton(
              label: StringResources.installText,
              onPressed: _onInstallButtonPressed,
            ),
          )
        ],
      ),
    );
  }

  getSharebleLinkWidget() {
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: _onShareButtonPressed,
            icon: Icon(Icons.share_outlined),
          ),
          Text(StringResources.getSharableAppLinkText)
        ],
      ),
    );
  }

  getAppDescriptionWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        StringResources.tempAppDescriptionText,
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }

  getWhatsNewWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ProjectColors.fadedRed.withOpacity(0.8),
            ProjectColors.fadedRed.withOpacity(0.6),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringResources.whatsNewText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(margin: EdgeInsets.only(top: 4)),
          Text(
            StringResources.tempBugFixText,
            style: TextStyle(color: Colors.white),
          ),
          Container(margin: EdgeInsets.only(top: 4)),
        ],
      ),
    );
  }

  getViewOlderBuildWidget() {
    return GestureDetector(
      onTap: _onViewOldBuildButtonPressed,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Text(
              StringResources.viewOlderBuildsText,
              style: TextStyle(fontSize: 12),
            ),
            Icon(Icons.navigate_next, color: ProjectColors.fadedRed)
          ],
        ),
      ),
    );
  }
}

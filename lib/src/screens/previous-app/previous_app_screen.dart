import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/models/app_model.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/widgets/app_display_card.dart';
import 'package:tartlabsstore/src/widgets/custom_appbar.dart';
import 'package:tartlabsstore/src/widgets/version_display_card.dart';

class PreviousAppScreen extends StatefulWidget {
  static const routeName = "/previousapp";

  final AppModel appDetail;

  const PreviousAppScreen({Key key, this.appDetail}) : super(key: key);
  @override
  _PreviousAppScreenState createState() => _PreviousAppScreenState();
}

class _PreviousAppScreenState extends State<PreviousAppScreen> {
  initState() {
    super.initState();
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
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            AppDisplayCard(
              app: widget.appDetail,
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

class PreviousAppScreenArguments {
  final AppModel appDetail;

  PreviousAppScreenArguments(this.appDetail);
}

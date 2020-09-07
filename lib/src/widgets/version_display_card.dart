import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/widgets/primary_button.dart';

class VersionDisplayCard extends StatelessWidget {
  _onShareButtonPressed() {}

  _onInstallButtonPressed() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              StringResources.tempDateText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              child: Icon(Icons.share),
              onTap: _onShareButtonPressed,
            )
          ]),
          Container(margin: EdgeInsets.only(top: 10)),
          Text(StringResources.tempBugFixText),
          Align(
            alignment: Alignment.bottomRight,
            child: PrimaryButton(
              label: StringResources.installText,
              onPressed: _onInstallButtonPressed,
            ),
          )
        ],
      ),
    );
  }
}

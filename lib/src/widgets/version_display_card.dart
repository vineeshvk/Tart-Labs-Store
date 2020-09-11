import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tartlabsstore/src/models/app_url_model.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/widgets/custom_text.dart';
import 'package:tartlabsstore/src/widgets/primary_button.dart';

class VersionDisplayCard extends StatelessWidget {
  final AppUrlModel previousApp;
  final void Function() onShareButtonPressed;
  final void Function() onInstallButtonPressed;

  VersionDisplayCard({
    this.previousApp,
    this.onShareButtonPressed,
    this.onInstallButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            CustomText(
              DateFormat.MMMd().format(previousApp.createdAt),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            GestureDetector(
              child: Icon(Icons.share_outlined),
              onTap: onShareButtonPressed,
            )
          ]),
          Container(margin: EdgeInsets.only(top: 10)),
          CustomText(previousApp.description),
          Align(
            alignment: Alignment.bottomRight,
            child: PrimaryButton(
              label: StringResources.installText,
              onPressed: onInstallButtonPressed,
            ),
          )
        ],
      ),
    );
  }
}

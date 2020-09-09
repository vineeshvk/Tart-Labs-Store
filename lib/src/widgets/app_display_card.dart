import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tartlabsstore/src/models/app_model.dart';
import 'package:tartlabsstore/src/widgets/custom_text.dart';

class AppDisplayCard extends StatelessWidget {
  final AppModel app;
  final bool isSelectable;
  final void Function() onTap;

  AppDisplayCard({
    @required this.app,
    this.onTap,
    this.isSelectable = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: EdgeInsets.all(16),
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
        child: Row(
          children: [
            Image.network(
              app.appLogo.replaceFirst(":", "s:"),
              width: 67,
              height: 67,
            ),
            Container(margin: EdgeInsets.only(left: 10)),
            getDetailTextWidget(),
            if (isSelectable) Icon(Icons.navigate_next)
          ],
        ),
      ),
    );
  }

  getDetailTextWidget() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(app.appName,fontSize: 16),
          CustomText(
            DateFormat.MMMd().format(app.updatedAt),
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}

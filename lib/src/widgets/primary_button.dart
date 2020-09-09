import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/utils/color_resources.dart';
import 'package:tartlabsstore/src/widgets/custom_text.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const PrimaryButton({@required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          color: ColorResources.BUTTON_BORDER,
          width: 2,
        ),
      ),
      child: CustomText(
        label,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      padding: EdgeInsets.symmetric(horizontal: 27, vertical: 8),
      colorBrightness: Brightness.dark,
      color: ColorResources.FADED_RED,
      onPressed: onPressed,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/utils/colors.dart';

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
          color: ProjectColors.buttonBorder,
          width: 2,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      padding: EdgeInsets.symmetric(horizontal: 27, vertical: 8),
      colorBrightness: Brightness.dark,
      color: ProjectColors.fadedRed,
      onPressed: onPressed,
    );
  }
}

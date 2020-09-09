import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/widgets/custom_text.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscureText;

  InputField({
    @required this.label,
    this.controller,
    this.icon,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          label,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 3),
                blurRadius: 6,
              )
            ],
          ),
          child: TextField(
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              icon: Icon(icon),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

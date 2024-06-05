import 'package:flutter/material.dart';
import 'package:teach_tech_mobile/app/core/values/app_values.dart';
import 'package:teach_tech_mobile/app/utils/text_style.dart';
class ExtendedOutlinedButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onPressed;

  const ExtendedOutlinedButton({
    required this.text,
    required this.color,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppValues.dimen_46,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.dimen_60),
          ),
          backgroundColor: color ?? Colors.red,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.attendanceTextStyle,
        ),
      ),
    );
  }
}

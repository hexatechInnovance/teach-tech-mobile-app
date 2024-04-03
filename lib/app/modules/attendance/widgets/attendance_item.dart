import 'package:flutter/material.dart';
import 'package:teach_tech_mobile/app/utils/text_style.dart';

class AttendanceItem extends StatelessWidget {
  final String id;
  final String name;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const AttendanceItem({
    required this.id,
    required this.name,
    required this.isChecked,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple[300],
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 2,
                child: Text(
                  id,
                  style: TextStyles.attendanceTextStyle,
                )),
            Expanded(
                flex: 7,
                child: Text(
                  name,
                  style: TextStyles.attendanceTextStyle,
                )),
            Expanded(
              flex: 1,
              child: Checkbox(
                checkColor: Colors.white,
                value: isChecked,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

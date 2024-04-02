import 'package:flutter/material.dart';

class CourseIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final Color backGroundColor;
  final VoidCallback onPressed;

  const CourseIconButton({
    required this.icon,
    required this.title,
    required this.color,
    required this.backGroundColor,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: backGroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}

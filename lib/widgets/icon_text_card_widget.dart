import 'package:flutter/material.dart';

class IconTextCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  IconTextCard({required this.icon, required this.text, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      // Define how the card's content should be clipped
      clipBehavior: Clip.antiAliasWithSaveLayer,
      //
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon, color: iconColor), // Icon on the left
            SizedBox(width: 8), // Space between icon and text
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

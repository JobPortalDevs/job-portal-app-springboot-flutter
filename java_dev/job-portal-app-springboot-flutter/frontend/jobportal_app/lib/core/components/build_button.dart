import 'package:flutter/material.dart';

Widget buildButton(
    {required BuildContext context,
    required String title,
    required IconData? icon,
    required VoidCallback onPressed,
    required Color color,
    required Color foregroundColor,
    required Color textColor}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: TextBold(
        text: title,
        size: 14,
        color: textColor,
      ),
    ),
  );
}

Widget buildSecondaryButton({
  required BuildContext context,
  required String title,
  required IconData? icon,
  required VoidCallback onPressed,
  required Color color,
  required Color borderColor,
  required Color textColor,
}) {
  return SizedBox(
    width: double.infinity,
    //MediaQuery.of(context).size.width * 0.9,
    height: 36,
    child: OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon) : const SizedBox.shrink(),
      label: TextBold(
        text: title,
        size: 14,
        color: textColor,
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: borderColor,
          width: 2.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: color,
      ),
    ),
  );
}

class TextBold extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const TextBold({
    super.key,
    required this.text,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: size,
        fontFamily: 'Muli',
        color: color,
      ),
    );
  }
}

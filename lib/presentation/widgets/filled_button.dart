import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class FilledButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double fontSize;
  final Color color;
  final Color textColor;
  final double width;
  final double height;

  const FilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 14,
    this.textColor = AppColors.white,
    this.width = double.infinity,
    this.height = 42,
    this.color = AppColors.red,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button?.copyWith(
                fontSize: fontSize,
                color: textColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
        ),
      ),
    );
  }
}

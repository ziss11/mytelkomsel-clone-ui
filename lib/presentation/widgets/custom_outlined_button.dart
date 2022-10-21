import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final AssetImage icon;
  final Color borderColor;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.icon,
    this.borderColor = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: BorderSide(
            color: borderColor,
            width: 1.5,
          ),
        ),
        onPressed: () {},
        child: Center(
          child: Row(
            children: [
              ImageIcon(
                icon,
                color: borderColor,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.button,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

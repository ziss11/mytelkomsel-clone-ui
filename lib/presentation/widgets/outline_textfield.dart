import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class OutlineTextField extends StatelessWidget {
  final String hint;

  const OutlineTextField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: AppColors.greyDark,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

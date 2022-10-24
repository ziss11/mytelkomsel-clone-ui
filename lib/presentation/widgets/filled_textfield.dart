import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class FilledTextField extends StatelessWidget {
  const FilledTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGrey,
        hintText: "Cari paket favorit kamu ...",
        hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        prefixIcon: const ImageIcon(
          AssetImage(
            "images/ic_search.png",
          ),
          color: AppColors.grey,
        ),
      ),
    );
  }
}

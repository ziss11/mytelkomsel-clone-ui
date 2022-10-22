import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/utilities/card_clipper.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class SimCard extends StatelessWidget {
  const SimCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CardClipper(),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            tileMode: TileMode.mirror,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.red,
              AppColors.darkRed,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "081234567890",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 18,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Image.asset(
                    "images/simpati-logo.png",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_button.dart';
import 'package:mytelkomsel_clone_ui/utilities/card_clipper.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class SimCard extends StatelessWidget {
  const SimCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CardClipper(),
      child: Container(
        width: double.infinity,
        height: 210,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              const SizedBox(
                height: 21,
              ),
              Text(
                "Sisa pulsa anda",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rp34.000",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                  ),
                  FilledButton(
                    text: "Isi Pulsa",
                    fontSize: 12,
                    textColor: AppColors.black,
                    width: 84,
                    height: 34,
                    color: AppColors.yellow,
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              Divider(
                color: AppColors.black.withOpacity(0.5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Berlaku sampai ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: AppColors.white),
                      children: [
                        TextSpan(
                          text: "19 April 2025",
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Telkomsel POIN ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: AppColors.white),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "120",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
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

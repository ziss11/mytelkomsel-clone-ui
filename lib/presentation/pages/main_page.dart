import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/sim_card.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';
import 'package:mytelkomsel_clone_ui/utilities/rounded_clipper.dart';

class MainPage extends StatelessWidget {
  static const path = "/";
  static const routeName = "main-page";

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: RoundedClipper(),
              child: Container(
                color: AppColors.red,
                width: double.infinity,
                height: 147,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SimCard(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.red,
      title: Text.rich(
        TextSpan(
          text: "Hai, ",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontSize: 18, color: AppColors.white),
          children: [
            TextSpan(
              text: "Abdul Azis",
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 18,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const ImageIcon(
            AssetImage(
              "images/ic-round-qrcode.png",
            ),
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

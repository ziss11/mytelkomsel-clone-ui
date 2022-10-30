import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/main_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_button.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/outlined_textfield.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class VerificationPage extends StatelessWidget {
  static const path = "verification";
  static const routeName = "verificaton-page";

  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "images/code-illustration.png",
                    height: 112,
                    width: 112,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Masukkan kode unik yang kami kirim",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Silakan periksa SMS kamu dan masukkan kode unik yang kami kirimkan ke 081234567890",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Kode Unik",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                const OutlinedTextField(
                  hint: "Cth. q5TsgH***",
                ),
                const SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Tidak menerima SMS ? ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: "Kirim ulang",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: AppColors.red,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                FilledButton(
                  text: "Lanjut".toUpperCase(),
                  onPressed: () => context.goNamed(MainPage.routeName),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

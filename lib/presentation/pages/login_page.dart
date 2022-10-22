import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/verification_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/custom_outlined_button.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_button.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/outline_textfield.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class LoginPage extends StatefulWidget {
  static const path = "/login";
  static const routeName = "login-page";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "images/login-illustration.png",
                      height: 133,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 46,
                ),
                Text(
                  "Silahkan masuk dengan nomor telkomsel kamu",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Nomor Hp",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                const OutlineTextField(
                  hint: "Cth, 08129011xxx",
                ),
                const SizedBox(
                  height: 8,
                ),
                CheckboxListTile(
                  activeColor: Theme.of(context).colorScheme.primary,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  checkColor: AppColors.white,
                  value: isChecked,
                  onChanged: (isCheck) {
                    setState(() {
                      isChecked = isCheck ?? false;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text.rich(
                    TextSpan(
                      text: "Saya menyetujui ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: ", dan",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: " syarat, ketentuan",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        TextSpan(
                          text: " privasi",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: " Telkomsel",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                FilledButton(
                  text: "Masuk",
                  onPressed: () => context.goNamed(VerificationPage.routeName),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Atau masuk menggunakan",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: AppColors.greyDark,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: CustomOutlinedButton(
                        text: "Facebook",
                        icon: AssetImage(
                          "images/ic_facebook.png",
                        ),
                        color: AppColors.fbBlue,
                      ),
                    ),
                    SizedBox(
                      width: 21,
                    ),
                    Expanded(
                      child: CustomOutlinedButton(
                        text: "Twitter",
                        icon: AssetImage(
                          "images/ic_twitter.png",
                        ),
                        color: AppColors.twitterBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/data/model/paket_model.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/main_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/custom_outlined_button.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_button.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class PaymentSuccessPage extends StatefulWidget {
  static const path = "payment-success";
  static const routeName = "payment-success-page";

  final PaketModel paket;

  const PaymentSuccessPage({super.key, required this.paket});

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  bool _isLike = false;
  bool _isDisLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 52),
                child: Image.asset(
                  "images/success-illustration.png",
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Pembayaran Berhasil",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Pembayaran paket internet telah berhasil. Kami akan memberitahu kamu jika paket sudah diaktifkan.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: AppColors.greyDark,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              _packageInfo(),
              Text(
                "NO. TRANSAKSI",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "A3012005123095745810",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bagaimana traksaksi kamu?",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (!_isDisLike) {
                          setState(() {
                            _isLike = !_isLike;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.thumb_up,
                        size: 20,
                        color: _isLike ? AppColors.red : AppColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (!_isLike) {
                          setState(() {
                            _isDisLike = !_isDisLike;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.thumb_down,
                        size: 20,
                        color: _isDisLike ? AppColors.red : AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: MyFilledButton(
                  text: "KEMBALI KE BERANDA",
                  onPressed: () => context.goNamed(
                    MainPage.routeName,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: CustomOutlinedButton(
                  text: "LIHAT PAKET",
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _packageInfo() {
    return Container(
      width: 283,
      margin: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(1, 1),
            color: AppColors.black.withOpacity(.1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "PAKET INTERNET",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: AppColors.greyDark,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "${widget.paket.description} ${widget.paket.data} ${widget.paket.unit}",
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "4.5 GB Internet + 2 GB OMG! + 60 SMS Tsel + 100 Mins Voice Tsel",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: AppColors.greyDark,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}

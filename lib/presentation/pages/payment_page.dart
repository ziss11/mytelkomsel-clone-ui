import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytelkomsel_clone_ui/data/model/paket_model.dart';
import 'package:mytelkomsel_clone_ui/data/payment_data.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class PaymentPage extends StatefulWidget {
  static const path = "payment";
  static const routeName = "payment-page";

  final PaketModel paket;

  const PaymentPage({super.key, required this.paket});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _radioIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _packageInfo(),
              _paymentMethod(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text(
        "Metode Pembayaran",
      ),
      titleTextStyle: Theme.of(context).textTheme.headline6?.copyWith(
            fontSize: 18,
            letterSpacing: 0,
          ),
      centerTitle: true,
    );
  }

  Widget _packageInfo() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.paket.description} ${widget.paket.data} ${widget.paket.unit}",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "4.5 GB Internet + 2 GB OMG! + 60 SMS Tsel + 100 Mins Voice Tsel",
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const ImageIcon(
                AssetImage(
                  "images/ic_count_down.png",
                ),
                color: AppColors.red,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Masa aktif ${widget.paket.numOfDay} ${widget.paket.dayUnit}",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.red,
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _paymentItem({
    required String title,
    required Function()? onTap,
    Widget? leading,
    String? subtitle,
    bool isSelected = false,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: SizedBox(
        height: double.infinity,
        child: leading,
      ),
      trailing: Icon(
        isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
        color: AppColors.red,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyText2,
            )
          : const SizedBox(),
    );
  }

  Widget _paymentMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pembayaran di MyTelkomsel",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 18,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: PaymentData.activePaymentList.length,
            itemBuilder: ((context, index) {
              final paymentData = PaymentData.activePaymentList[index];
              return _paymentItem(
                isSelected: _radioIndex == index,
                onTap: () {
                  setState(() {
                    _radioIndex = index;
                  });
                },
                title: paymentData.name,
                subtitle: NumberFormat.currency(
                  locale: "id",
                  decimalDigits: 0,
                  symbol: "Rp",
                ).format(paymentData.value),
                leading: Image.asset(paymentData.image),
              );
            }),
          ),
        ],
      ),
    );
  }
}

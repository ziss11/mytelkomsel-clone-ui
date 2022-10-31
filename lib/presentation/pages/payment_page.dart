import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/data/model/paket_model.dart';

class PaymentPage extends StatelessWidget {
  static const path = "payment";
  static const routeName = "payment-page";

  final PaketModel paket;

  const PaymentPage({super.key, required this.paket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
    );
  }

  AppBar _appBar(BuildContext context) {
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
}

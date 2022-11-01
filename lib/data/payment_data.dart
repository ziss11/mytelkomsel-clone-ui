import 'package:mytelkomsel_clone_ui/data/model/payment_model.dart';

abstract class PaymentData {
  static const activePaymentList = [
    PaymentModel(
      name: "Pulsa",
      value: 12000,
      image: "images/ic_card.png",
    ),
    PaymentModel(
      name: "LinkAja",
      value: 76200,
      image: "images/ic_linkaja.png",
    ),
  ];

  static const eWallet = [
    PaymentModel(
      name: "Gopay",
      image: "images/ic_gopay.png",
    ),
    PaymentModel(
      name: "OVO",
      image: "images/ic_ovo.png",
    ),
    PaymentModel(
      name: "LinkAja",
      image: "images/ic_linkaja.png",
    ),
  ];
}

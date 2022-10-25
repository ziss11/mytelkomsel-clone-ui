import 'package:mytelkomsel_clone_ui/data/model/paket_model.dart';

abstract class PaketData {
  static const langgananList = [
    PaketModel(
      data: 14,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "hari",
      price: 99000,
      description: "Internet OMG!",
      priceBeforeDisc: 96000,
    ),
    PaketModel(
      data: 27,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "hari",
      price: 133000,
      description: "Internet OMG!",
      priceBeforeDisc: 145000,
    ),
  ];

  static const popularList = [
    PaketModel(
      data: 14,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "hari",
      price: 99000,
      description: "Internet OMG!",
      priceBeforeDisc: 96000,
    ),
    PaketModel(
      data: 20,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "hari",
      description: "Kuota Keluarga",
      price: 150000,
    ),
  ];

  static const belajarList = [
    PaketModel(
      data: 30,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "hari",
      description: "RuangGuru",
      price: "free",
    ),
    PaketModel(
      data: 20,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "hari",
      description: "Ilmupedia",
      price: "free",
    ),
  ];
}

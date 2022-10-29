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

  static const searchResultList = [
    PaketModel(
      data: 14,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "Hari",
      price: 96000,
      priceBeforeDisc: 99000,
      description: "Internet OMG!",
    ),
    PaketModel(
      data: 27,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "Hari",
      price: 141000,
      priceBeforeDisc: 154000,
      description: "Internet OMG!",
    ),
    PaketModel(
      data: 6.5,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "Hari",
      price: 61000,
      priceBeforeDisc: 63000,
      description: "Combo OMG!",
    ),
    PaketModel(
      data: 4,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "Hari",
      price: 37000,
      priceBeforeDisc: 38000,
      description: "Internet OMG!",
    ),
    PaketModel(
      data: 7,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "Hari",
      price: 61000,
      priceBeforeDisc: 63000,
      description: "Internet OMG!",
    ),
    PaketModel(
      data: 52,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "Hari",
      price: 101000,
      priceBeforeDisc: 172000,
      description: "Internet OMG!",
    ),
    PaketModel(
      data: 19,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "Hari",
      price: 110000,
      priceBeforeDisc: 119000,
      description: "Combo OMG!",
    ),
    PaketModel(
      data: 30,
      unit: "GB",
      numOfDay: 30,
      dayUnit: "Hari",
      price: 139000,
      priceBeforeDisc: 155000,
      description: "Combo OMG!",
    ),
  ];
}

import 'package:equatable/equatable.dart';

class PaketModel extends Equatable {
  final num data;
  final String unit;
  final int numOfDay;
  final String dayUnit;
  final dynamic price;
  final int? priceBeforeDisc;
  final String description;

  const PaketModel({
    required this.data,
    required this.unit,
    required this.numOfDay,
    required this.dayUnit,
    required this.price,
    required this.description,
    this.priceBeforeDisc,
  });

  @override
  List<Object?> get props => [
        data,
        unit,
        numOfDay,
        dayUnit,
        price,
        priceBeforeDisc,
      ];
}

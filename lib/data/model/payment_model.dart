import 'package:equatable/equatable.dart';

class PaymentModel extends Equatable {
  final String name;
  final num? value;
  final String image;

  const PaymentModel({
    required this.name,
    required this.image,
    this.value,
  });

  @override
  List<Object?> get props => [name, value, image];
}

import 'package:flutter/material.dart';

class BantuanPage extends StatelessWidget {
  const BantuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Bantuan Page",
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}

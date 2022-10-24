import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_textfield.dart';

class InternetPage extends StatelessWidget {
  static const path = "internet";
  static const routeName = "internet-page";

  const InternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Paket Internet",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: 16,
              ),
              child: FilledTextField(),
            ),
          ],
        ),
      ),
    );
  }
}

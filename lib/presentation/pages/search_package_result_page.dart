import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_textfield.dart';

class SearchPackageResultPage extends StatefulWidget {
  static const path = "search-package-result";
  static const routeName = "search-package-result-page";

  const SearchPackageResultPage({super.key});

  @override
  State<SearchPackageResultPage> createState() =>
      _SearchPackageResultPageState();
}

class _SearchPackageResultPageState extends State<SearchPackageResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: FilledTextField(
        textInputAction: TextInputAction.search,
      ),
    );
  }
}

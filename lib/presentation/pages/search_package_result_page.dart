import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/search_package_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_textfield.dart';

class SearchPackageResultPage extends StatefulWidget {
  static const path = "search-package-result/:query";
  static const routeName = "search-package-result-page";

  final String query;

  const SearchPackageResultPage({
    super.key,
    required this.query,
  });

  @override
  State<SearchPackageResultPage> createState() =>
      _SearchPackageResultPageState();
}

class _SearchPackageResultPageState extends State<SearchPackageResultPage> {
  final _focusNode = FocusNode();
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
    _searchController = TextEditingController(text: widget.query);
    _searchController.addListener(() {
      setState(() {
        _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leadingWidth: 26,
      title: FilledTextField(
        focusNode: _focusNode,
        controller: _searchController,
        textInputAction: TextInputAction.search,
        onChanged: (value) {
          if (_searchController.text.isEmpty && value.isEmpty) {
            context.pushNamed(SearchPackagePage.routeName);
          }
        },
      ),
    );
  }
}

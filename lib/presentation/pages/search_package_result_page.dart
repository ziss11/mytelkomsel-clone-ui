import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/data/paket_data.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/search_package_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_textfield.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filter_bottom_sheet.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/package_card.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/sort_bottom_sheet.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class SearchPackageResultPage extends StatefulWidget {
  static const path = "search-package-result/:query";
  static const routeName = "search-package-result-page";

  final String query;

  const SearchPackageResultPage({super.key, required this.query});

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
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        context.pushNamed(
          SearchPackagePage.routeName,
          extra: widget.query,
        );
        _focusNode.unfocus();
      }
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
    _searchController = TextEditingController(text: widget.query);

    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: _searchResult(),
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
      ),
      bottom: _searchOption(context),
    );
  }

  Widget _optionItem(BuildContext context, Function() onTap, ImageProvider icon,
      String optionName, Color color) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 11,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            ImageIcon(
              icon,
              color: color,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              optionName,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize _searchOption(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(38),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
        ),
        child: Row(
          children: [
            _optionItem(
              context,
              _filterBottomSheet,
              const AssetImage("images/ic_filter.png"),
              "Filter",
              AppColors.red,
            ),
            const SizedBox(
              width: 12,
            ),
            _optionItem(
              context,
              _sortBottomSheet,
              const AssetImage("images/ic_sort.png"),
              "Urutkan",
              AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  void _filterBottomSheet() {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const FilterBottomSheet(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
    );
  }

  void _sortBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const SortBottomSheet(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
    );
  }

  Widget _searchResult() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: PaketData.searchResultList.length,
      separatorBuilder: (context, idx) => const SizedBox(height: 12),
      itemBuilder: (context, idx) => PackageCard(
        paket: PaketData.searchResultList[idx],
      ),
    );
  }
}

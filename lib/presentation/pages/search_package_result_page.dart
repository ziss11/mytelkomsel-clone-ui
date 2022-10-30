import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/data/paket_data.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/search_package_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_textfield.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/outlined_textfield.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/package_card.dart';
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
              () {},
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                width: 62,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 34,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filter",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Hapus",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: AppColors.red,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Divider(
                thickness: 2,
                height: 2,
                color: AppColors.lightGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                "Kisaran Harga",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Minimal",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const SizedBox(
                        width: 162,
                        child: OutlinedTextField(
                          initialValue: "Rp0",
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Maximal",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const SizedBox(
                        width: 162,
                        child: OutlinedTextField(
                          initialValue: "Rp250.000",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
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

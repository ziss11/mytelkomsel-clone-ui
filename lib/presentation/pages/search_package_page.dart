import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/search_package_result_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_textfield.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class SearchPackagePage extends StatefulWidget {
  static const path = "search_package";
  static const routeName = "search-package-page";

  final String? query;

  const SearchPackagePage({super.key, this.query});

  @override
  State<SearchPackagePage> createState() => _SearchPackagePageState();
}

class _SearchPackagePageState extends State<SearchPackagePage> {
  String query = "";

  final _focusNode = FocusNode();
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.query);
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _searchHistory(),
              _popularSearch(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: FilledTextField(
        controller: _searchController,
        onSubmitted: (value) {
          if (_searchController.text.isNotEmpty && value.isNotEmpty) {
            context.goNamed(
              SearchPackageResultPage.routeName,
              params: {"query": value},
            );
          }
        },
        focusNode: _focusNode,
        textInputAction: TextInputAction.search,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
          ),
          child: TextButton(
            onPressed: () => context.pop(),
            child: Text(
              "Batal",
              style: Theme.of(context).textTheme.button?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0,
                    color: AppColors.red,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchHistoryItem(int id, String text) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: () {
        context.goNamed(
          SearchPackageResultPage.routeName,
          params: {"query": text},
        );
      },
      child: Row(
        children: [
          const ImageIcon(
            AssetImage(
              "images/ic_time_backward.png",
            ),
            color: AppColors.grey,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyDark,
                ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.clear,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchHistory() {
    final historyList = [
      _searchHistoryItem(1, "ruang guru"),
      _searchHistoryItem(2, "omg"),
      _searchHistoryItem(3, "ketengan"),
      _searchHistoryItem(4, "ilmupedia"),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Terakhir dicari",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 12,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: historyList.length,
            itemBuilder: (context, idx) {
              return historyList[idx];
            },
          ),
        ],
      ),
    );
  }

  Widget _popularSearchItem(String text) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        context.goNamed(
          SearchPackageResultPage.routeName,
          params: {"query": text},
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.red),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.caption?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.red,
                letterSpacing: 0,
              ),
        ),
      ),
    );
  }

  Widget _popularSearch() {
    final popularList = [
      _popularSearchItem("ruang guru"),
      _popularSearchItem("ketengan"),
      _popularSearchItem("Conference"),
      _popularSearchItem("omg"),
      _popularSearchItem("ilmupedia"),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Pencarian populer",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 7,
            runSpacing: 8,
            children: popularList.map((popular) => popular).toList(),
          ),
        ],
      ),
    );
  }
}

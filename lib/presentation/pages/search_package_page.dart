import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/internet_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_textfield.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class SearchPackagePage extends StatefulWidget {
  static const path = "search-package";
  static const routeName = "search-package-page";

  const SearchPackagePage({super.key});

  @override
  State<SearchPackagePage> createState() => _SearchPackagePageState();
}

class _SearchPackagePageState extends State<SearchPackagePage> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
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
      title: SizedBox(
        width: double.infinity,
        height: 40,
        child: FilledTextField(
          focusNode: _focusNode,
          textInputAction: TextInputAction.search,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
          ),
          child: TextButton(
            onPressed: () => context.goNamed(
              InternetPage.routeName,
            ),
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

  Widget _searchHistoryItem(String text) {
    return Row(
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
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: const Icon(
            Icons.clear,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }

  Widget _searchHistory() {
    final historyList = [
      _searchHistoryItem("ruang guru"),
      _searchHistoryItem("omg"),
      _searchHistoryItem("ketengan"),
      _searchHistoryItem("ilmupedia"),
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
    return Container(
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

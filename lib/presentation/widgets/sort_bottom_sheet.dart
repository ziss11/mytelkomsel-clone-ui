import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_button.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({super.key});

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  int _indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    final optionList = [
      "Paling Sesuai",
      "Terbaru",
      "Harga Terendah",
      "Harga Tertinggi",
    ];

    return SizedBox(
      height: 350,
      child: Column(
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
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 11),
            child: Text(
              "Urutkan",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: optionList.length,
            itemBuilder: (context, index) {
              return _sortOption(
                isSelected: _indexSelected == index,
                text: optionList[index],
                onTap: () {
                  setState(() {
                    _indexSelected = index;
                  });
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: FilledButton(
              text: "SIMPAN",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _sortOption(
      {required String text, Function()? onTap, bool isSelected = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: AppColors.lightGrey,
              width: 1.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            isSelected
                ? const Icon(
                    Icons.check,
                    color: AppColors.red,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

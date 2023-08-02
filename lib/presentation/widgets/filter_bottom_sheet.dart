import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytelkomsel_clone_ui/data/paket_data.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_button.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/outlined_textfield.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
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
              top: 16,
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
          SizedBox(
            height: 452,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
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
                            SizedBox(
                              width: 162,
                              child: OutlinedTextField(
                                keyboardType: TextInputType.number,
                                initialValue: "Rp0",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r"[0-9]")),
                                  CurrencyTextInputFormatter(
                                    locale: "id",
                                    decimalDigits: 0,
                                    symbol: "Rp",
                                  ),
                                ],
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
                            SizedBox(
                              width: 162,
                              child: OutlinedTextField(
                                keyboardType: TextInputType.number,
                                initialValue: "Rp250000",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r"[0-9]")),
                                  CurrencyTextInputFormatter(
                                    locale: "id",
                                    decimalDigits: 0,
                                    symbol: "Rp",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Slider.adaptive(
                        value: sliderValue,
                        max: 10,
                        activeColor: AppColors.red,
                        inactiveColor: AppColors.lightGrey,
                        onChanged: ((value) {
                          setState(() {
                            sliderValue = value.roundToDouble();
                          });
                        }),
                      );
                    },
                  ),
                  SizedBox(
                    height: 32,
                    child: _horizontalList(
                      items: PaketData.priceRangeList,
                      itemBuilder: (context, index) {
                        return _horizontalListItem(
                          Text(
                            PaketData.priceRangeList[index],
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.black,
                                    ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 28, 20, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kategori",
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        Text(
                          "Hapus",
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: AppColors.red,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 44,
                    child: _horizontalList(
                      items: PaketData.kategoriList,
                      itemBuilder: (context, index) {
                        return _horizontalListItem(
                          Text(
                            PaketData.kategoriList[index],
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 28, 20, 16),
                    child: Text(
                      "Masa Aktif",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 44,
                    child: _horizontalList(
                      items: PaketData.masaAktifList,
                      itemBuilder: (context, index) {
                        return _horizontalListItem(
                          Row(
                            children: [
                              const ImageIcon(
                                AssetImage(
                                  "images/ic_count_down.png",
                                ),
                              ),
                              Text(
                                "${PaketData.masaAktifList[index]} HARI",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.black,
                                    ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 28, 20, 16),
                    child: Text(
                      "Penawaran",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 44,
                    child: _horizontalList(
                      items: PaketData.penawaranList,
                      itemBuilder: (context, index) {
                        return _horizontalListItem(
                          Text(
                            PaketData.penawaranList[index],
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: MyFilledButton(
              text: "PASANG FILTER",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _horizontalList({
    List<dynamic>? items,
    Widget Function(BuildContext, int)? itemBuilder,
  }) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: items != null ? items.length : 0,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      itemBuilder: itemBuilder!,
      separatorBuilder: (context, index) {
        return const SizedBox(width: 8);
      },
    );
  }

  Widget _horizontalListItem(Widget child) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.lightGrey,
      ),
      child: child,
    );
  }
}

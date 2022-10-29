import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytelkomsel_clone_ui/data/model/paket_model.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_textfield.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class PackageDetail extends StatelessWidget {
  static const path = "package-detail";
  static const routeName = "package-detail-page";

  final PaketModel paket;

  const PackageDetail({super.key, required this.paket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(context),
              _masaAktif(context),
              _rincianPaket(context)
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const FilledTextField(),
      leadingWidth: 38,
      titleSpacing: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
          ),
        ),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    paket.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    "${paket.data} ${paket.unit}",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage(
                    "images/ic_bookmark32.png",
                  ),
                  color: AppColors.grey,
                  size: 32,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          paket.priceBeforeDisc != null
              ? Text(
                  NumberFormat.currency(
                    locale: "id",
                    symbol: "Rp",
                    decimalDigits: 0,
                  ).format(
                    paket.priceBeforeDisc,
                  ),
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: AppColors.greyDark,
                        decoration: TextDecoration.lineThrough,
                      ),
                )
              : const SizedBox(),
          Text(
            paket.price is int
                ? NumberFormat.currency(
                    locale: "id",
                    symbol: "Rp",
                    decimalDigits: 0,
                  ).format(
                    paket.price,
                  )
                : paket.price.toString().toUpperCase(),
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: AppColors.red,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }

  Widget _masaAktif(BuildContext context) {
    return Container(
      color: AppColors.white,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Masa Aktif Paket",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.lightGrey,
            ),
            child: Row(
              children: [
                const ImageIcon(
                  AssetImage(
                    "images/ic_count_down.png",
                  ),
                  color: AppColors.red,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "${paket.numOfDay} ${paket.dayUnit.toUpperCase()}",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.red,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rincianItem(
      BuildContext context, String label, dynamic data, String unit) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            "$data ${unit.toUpperCase()}",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _rincianPaket(BuildContext context) {
    return Container(
      color: AppColors.white,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rincian Paket",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          Wrap(
            children: [
              _rincianItem(context, "Internet", paket.data, paket.unit),
              _rincianItem(context, "OMG!", 2, "gb"),
              _rincianItem(context, "SMS Tsel", 60, "sms"),
              _rincianItem(context, "Voice Tsel", 100, "mins"),
            ],
          ),
        ],
      ),
    );
  }
}

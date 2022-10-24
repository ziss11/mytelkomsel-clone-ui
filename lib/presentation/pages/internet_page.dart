import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_textfield.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

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
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: 16,
              ),
              child: FilledTextField(),
            ),
            _newPaketInternet(),
            _langgananList(context),
          ],
        ),
      ),
    );
  }

  Widget _newPaketInternet() {
    return SizedBox(
      height: 100,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        scrollDirection: Axis.horizontal,
        children: [
          Image.asset(
            "images/terbaru1.png",
          ),
          const SizedBox(
            width: 12,
          ),
          Image.asset(
            "images/terbaru2.png",
          ),
        ],
      ),
    );
  }

  Widget _langgananItem(
    BuildContext context,
    int data,
    String unit,
    int numOfDay,
    String dayUnit,
    int priceBeforeDisc,
    int priceAfterDisc,
  ) {
    return SizedBox(
      width: 248,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$data $unit",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
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
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "$numOfDay ${dayUnit.toUpperCase()}",
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const ImageIcon(
                      AssetImage(
                        "images/ic_bookmark.png",
                      ),
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                NumberFormat.currency(
                  locale: "id",
                  symbol: "Rp",
                  decimalDigits: 0,
                ).format(
                  priceBeforeDisc,
                ),
                style: Theme.of(context).textTheme.caption?.copyWith(
                    color: AppColors.greyDark,
                    decoration: TextDecoration.lineThrough),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    NumberFormat.currency(
                      locale: "id",
                      symbol: "Rp",
                      decimalDigits: 0,
                    ).format(
                      priceAfterDisc,
                    ),
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: AppColors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    "Internet OMG!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _langgananList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 32,
            left: 16,
            right: 16,
            bottom: 20,
          ),
          child: Text(
            "Langganan Kamu",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 130,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            scrollDirection: Axis.horizontal,
            children: [
              _langgananItem(context, 14, "GB", 30, "hari", 99000, 96000),
              _langgananItem(context, 27, "GB", 30, "hari", 145000, 133000),
            ],
          ),
        ),
      ],
    );
  }
}

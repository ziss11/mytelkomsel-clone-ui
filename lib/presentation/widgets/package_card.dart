import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mytelkomsel_clone_ui/data/model/paket_model.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/package_detail.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class PackageCard extends StatelessWidget {
  final PaketModel paket;

  const PackageCard({super.key, required this.paket});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        PackageDetail.routeName,
        extra: paket,
      ),
      child: SizedBox(
        width: 248,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(.1),
                blurRadius: 1,
                offset: const Offset(1, 1),
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${paket.data} ${paket.unit}",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
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
                          "${paket.numOfDay} ${paket.dayUnit.toUpperCase()}",
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
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
              paket.priceBeforeDisc != null
                  ? Text(
                      NumberFormat.currency(
                        locale: "id",
                        symbol: "Rp",
                        decimalDigits: 0,
                      ).format(
                        paket.priceBeforeDisc,
                      ),
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          color: AppColors.greyDark,
                          decoration: TextDecoration.lineThrough),
                    )
                  : const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
}

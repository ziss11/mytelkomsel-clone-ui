import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytelkomsel_clone_ui/data/model/paket_model.dart';
import 'package:mytelkomsel_clone_ui/data/paket_data.dart';
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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 32,
            top: 12,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: FilledTextField(),
              ),
              _newPaketInternet(),
              _paketList(
                context,
                "Langganan Kamu",
                PaketData.langgananList,
              ),
              _kategoriList(context),
              _paketList(
                context,
                "Popular",
                PaketData.popularList,
              ),
              _paketList(
                context,
                "Belajar #dirumahaja",
                PaketData.belajarList,
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
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

  Widget _paketItem(BuildContext context, PaketModel paket) {
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
                    "${paket.data} ${paket.unit}",
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
                          "${paket.numOfDay} ${paket.dayUnit.toUpperCase()}",
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

  Widget _paketList(
    BuildContext context,
    String title,
    List<PaketModel> paketList,
  ) {
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
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 130,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: paketList.length,
            itemBuilder: (context, index) {
              return _paketItem(
                context,
                paketList[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _kategoriItem(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.red,
            AppColors.darkRed,
          ],
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        overflow: TextOverflow.clip,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
      ),
    );
  }

  Widget _kategoriList(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 16,
            right: 16,
            bottom: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kategori",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                "Lihat Semua",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: AppColors.red,
                      fontWeight: FontWeight.w500,
                    ),
              )
            ],
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 60,
            maxHeight: 128,
          ),
          child: GridView.count(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            scrollDirection: Axis.horizontal,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: .4,
            children: [
              _kategoriItem(
                context,
                "My Telkomsel Reward",
              ),
              _kategoriItem(
                context,
                "Combo SAKTI",
              ),
              _kategoriItem(
                context,
                "Paket Conference",
              ),
              _kategoriItem(
                context,
                "Internet Mingguan",
              ),
              _kategoriItem(
                context,
                "Internet Bulanan",
              ),
              _kategoriItem(
                context,
                "iPhone Plan",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

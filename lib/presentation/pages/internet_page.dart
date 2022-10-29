import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/data/model/paket_model.dart';
import 'package:mytelkomsel_clone_ui/data/paket_data.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/search_package_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_textfield.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/package_card.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class InternetPage extends StatefulWidget {
  static const path = "internet";
  static const routeName = "internet-page";

  const InternetPage({super.key});

  @override
  State<InternetPage> createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        context.goNamed(SearchPackagePage.routeName);
        _focusNode.unfocus();
      }
    });
  }

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
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: FilledTextField(
                  focusNode: _focusNode,
                ),
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
              return PackageCard(
                paket: paketList[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _kategoriItem(String text) {
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
              _kategoriItem("My Telkomsel Reward"),
              _kategoriItem("Combo SAKTI"),
              _kategoriItem("Paket Conference"),
              _kategoriItem("Internet Mingguan"),
              _kategoriItem("Internet Bulanan"),
              _kategoriItem("iPhone Plan"),
            ],
          ),
        ),
      ],
    );
  }
}

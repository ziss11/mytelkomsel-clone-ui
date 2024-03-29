import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/internet_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/card_clipper.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/filled_button.dart';
import 'package:mytelkomsel_clone_ui/presentation/widgets/rounded_clipper.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ClipPath(
            clipper: RoundedClipper(),
            child: Container(
              color: AppColors.red,
              width: double.infinity,
              height: 147,
            ),
          ),
          Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: _simCard(context),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _statusCard(context, "Internet", 12.9, "GB"),
                          _statusCard(context, "Telepon", 0, "Min"),
                          _statusCard(context, "SMS", 23, "SMS"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 8,
                color: AppColors.lightGrey,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _kategoryPaket(context),
                        _telkomselNewList(context),
                        _tanggapCovidList(context),
                        _linkAjaList(context: context),
                        _voucherList(context),
                        _penawaranList(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _simCard(BuildContext context) {
    return ClipPath(
      clipper: CardClipper(),
      child: Container(
        width: double.infinity,
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            tileMode: TileMode.mirror,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.red,
              AppColors.darkRed,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "081234567890",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 18,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                  ),
                  Image.asset(
                    "images/simpati-logo.png",
                  ),
                ],
              ),
              const SizedBox(
                height: 21,
              ),
              Text(
                "Sisa pulsa anda",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp',
                      decimalDigits: 0,
                    ).format(37000),
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                  ),
                  MyFilledButton(
                    text: "Isi Pulsa",
                    fontSize: 12,
                    textColor: AppColors.black,
                    width: 84,
                    height: 34,
                    color: AppColors.yellow,
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              Divider(
                color: AppColors.black.withOpacity(0.5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Berlaku sampai ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: AppColors.white),
                      children: [
                        TextSpan(
                          text: "19 April 2025",
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Telkomsel POIN ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: AppColors.white),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "120",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusCard(
    BuildContext context,
    String title,
    num data,
    String unit,
  ) {
    return Container(
      width: 101,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.1),
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.caption?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text.rich(
            TextSpan(
              text: "${data.toString()} ",
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.red,
                  ),
              children: [
                TextSpan(
                  text: unit,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _kategoriItem(
    BuildContext context,
    Function() onTap,
    String image,
    String label,
  ) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 92,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.yellow.withOpacity(.2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                image,
                width: 32,
                height: 32,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _kategoryPaket(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 16,
            bottom: 8,
          ),
          child: Text(
            "Kategori Paket",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          crossAxisCount: 4,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
          children: [
            _kategoriItem(
              context,
              () => context.goNamed(InternetPage.routeName),
              "images/internet-kategori.png",
              "Internet",
            ),
            _kategoriItem(
              context,
              () {},
              "images/telp-kategori.png",
              "Telepon",
            ),
            _kategoriItem(
              context,
              () {},
              "images/sms-kategori.png",
              "SMS",
            ),
            _kategoriItem(
              context,
              () {},
              "images/roaming-kategori.png",
              "Roaming",
            ),
            _kategoriItem(
              context,
              () {},
              "images/hiburan-kategori.png",
              "Hiburan",
            ),
            _kategoriItem(
              context,
              () {},
              "images/unggulan-kategori.png",
              "Unggulan",
            ),
            _kategoriItem(
              context,
              () {},
              "images/tersimpan-kategori.png",
              "Tersimpan",
            ),
            _kategoriItem(
              context,
              () {},
              "images/riwayat-kategori.png",
              "Riwayat",
            ),
          ],
        ),
      ],
    );
  }

  Widget _longListItem({
    required BuildContext? context,
    double? width,
    String? image,
    String? description,
  }) {
    return SizedBox(
      width: width,
      child: Card(
        elevation: 4,
        shadowColor: AppColors.black.withOpacity(.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: description != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  image != null
                      ? Image.asset(
                          image,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: Text(
                      description,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context!)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            : image != null
                ? Image.asset(image)
                : const SizedBox(),
      ),
    );
  }

  Widget _telkomselNewList(BuildContext context) {
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
                "Terbaru dari Telkomsel",
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
        SizedBox(
          height: 100,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            children: [
              _longListItem(
                context: context,
                image: "images/terbaru1.png",
              ),
              _longListItem(
                context: context,
                image: "images/terbaru2.png",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tanggapCovidList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 32,
            left: 16,
            bottom: 20,
          ),
          child: Text(
            "Tanggap COVID-19",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 172,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              _longListItem(
                context: context,
                width: 248,
                image: "images/tanggap1.png",
                description: "Diskon Spesial 25% Untuk Pelanggan Baru",
              ),
              _longListItem(
                context: context,
                width: 248,
                image: "images/tanggap2.png",
                description: "Bebas Kuota Akses Layanan Kesehatan",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _linkAjaItem({
    required BuildContext? context,
    String? image,
    String? description,
  }) {
    return SizedBox(
      width: 145,
      child: Card(
        elevation: 4,
        shadowColor: AppColors.black.withOpacity(.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            image != null ? Image.asset(image) : const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: Text(
                description ?? "",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context!).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _linkAjaList({required BuildContext? context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 32,
            left: 16,
            bottom: 20,
          ),
          child: Text(
            "AYO! Pake LinkAja!",
            style: Theme.of(context!)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            bottom: 20,
          ),
          child: Text(
            "Pakai LinkAja untuk beli pulsa, beli paket data dan bayar tagihan lebih mudah.",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        SizedBox(
          height: 132,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            scrollDirection: Axis.horizontal,
            children: [
              _linkAjaItem(
                context: context,
                image: "images/linkaja1.png",
                description: "Bayar Serba Cepat",
              ),
              _linkAjaItem(
                context: context,
                image: "images/linkaja2.png",
                description: "Cukup Scan QR",
              ),
              _linkAjaItem(
                context: context,
                image: "images/linkaja3.png",
                description: "NO! Credit Card",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _voucherList(BuildContext context) {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cari Voucher, Yuk!",
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
        SizedBox(
          height: 172,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              _longListItem(
                context: context,
                width: 248,
                image: "images/voucher1.png",
                description: "Double Benefits from DOUBLE UNTUNG",
              ),
              _longListItem(
                context: context,
                width: 248,
                image: "images/voucher2.png",
                description: "Join Undi-Undi Hepi 2020!",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _penawaranList(BuildContext context) {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Penawaran Terbatas",
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
        SizedBox(
          height: 172,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              _longListItem(
                context: context,
                width: 248,
                image: "images/penawaran1.png",
                description: "Terus Belajar dari Rumahmu dengan Ruangguru!",
              ),
              _longListItem(
                context: context,
                width: 248,
                image: "images/penawaran2.png",
                description: "Belajar Kini Makin Mudah dengan Paket ilmupedia!",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

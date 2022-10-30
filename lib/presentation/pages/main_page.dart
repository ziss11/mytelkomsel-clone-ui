import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/bantuan_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/home_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/inbox_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/profile_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/riwayat_page.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class MainPage extends StatefulWidget {
  static const path = "/";
  static const routeName = "main-page";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex == 0 ? _appBar(context) : AppBar(),
      bottomNavigationBar: _bottomNavbar(context),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: const [
          HomePage(),
          RiwayatPage(),
          BantuanPage(),
          InboxPage(),
          ProfilePage(),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.red,
      title: Text.rich(
        TextSpan(
          text: "Hai, ",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontSize: 18, color: AppColors.white),
          children: [
            TextSpan(
              text: "Abdul Azis",
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 18,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const ImageIcon(
            AssetImage(
              "images/ic-round-qrcode.png",
            ),
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _bottomNavbar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.1),
            blurRadius: 1,
            offset: const Offset(0, -1),
            spreadRadius: 1,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: Theme.of(context).textTheme.overline?.copyWith(
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.overline?.copyWith(
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
        showUnselectedLabels: true,
        selectedItemColor: AppColors.red,
        unselectedItemColor: AppColors.greyDark,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/ic_home.png")),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/ic_time.png")),
            label: "Riwayat",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/ic_help.png")),
            label: "Bantuan",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/ic_email.png")),
            label: "Inbox",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/ic_profile.png")),
            label: "Akun Saya",
          ),
        ],
      ),
    );
  }
}

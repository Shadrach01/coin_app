import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/coin_market/presentation/view/coin_market_screen.dart';
import 'package:coin_app/features/home_page/portfolio_settings/view/portfolio_settings.dart';
import 'package:coin_app/features/home_page/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:get/get.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _index = 0;
  //Tracks if the dialog is open
  bool _isDialogOpen = false;

  List<Widget> screens = const [
    HomeScreen(),
    CoinMarketScreen(),
    PortfolioSettings(),
    Text("TExt"),
    Text("TExt"),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: ColorRes.appTransparent,
        // Ensure transparency
        selectedItemColor: ColorRes.appBlue,
        unselectedItemColor: ColorRes.appGrey.withOpacity(.3),
        elevation: 0,

        currentIndex: _index,
        onTap: (value) {
          if (value == 2) {
            // Update the index to ensure the polygon icon changes
            setState(() {
              _index = value;
            });
            // Show dialog when the polygon icon is clicked
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const PortfolioSettings(),
            ).then((_) {
              // Reset the index when the dialog is closed
              setState(() {
                _index = 0;
              });
            });
          } else {
            setState(() {
              _index = value;
            });
          }
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.copy),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.event_note_outlined,
              size: 25,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                if (_index == 2) {
                  // Close the dialog if the icon is tapped and dialog is opened
                  Get.back();
                  setState(() {
                    _index = -1;
                  });
                } else {
                  setState(() {
                    _index = 2;
                  });
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => const PortfolioSettings(),
                  );
                }
              },
              child: ClipPolygon(
                sides: 6,
                borderRadius: 10,
                child: Container(
                  height: height * .06,
                  width: width * .15,
                  color: _index == 2 ? Colors.pink : ColorRes.appBlue,
                  child: _index == 2
                      ? Icon(
                          Icons.cancel_outlined,
                          color: ColorRes.appWhite,
                          size: height * .04,
                        )
                      : Icon(
                          Icons.add,
                          color: ColorRes.appWhite,
                          size: height * .04,
                        ),
                ),
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}

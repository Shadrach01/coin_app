import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/home_page/portfolio_settings/view/portfolio_settings.dart';
import 'package:coin_app/features/home_page/presentation/widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  List<Widget> screens = const [
    HomeScreenWidgets(),
    Text("TExt"),
    PortfolioSettings(),
    Text("TExt"),
    Text("TExt"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      // extendBody: true,
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: ColorRes.appTransparent,
        // Ensure transparency
        selectedItemColor: ColorRes.appBlue,
        unselectedItemColor: ColorRes.appGrey.withOpacity(.3),
        elevation: 0,
        // Remove elevation/shadow
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
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
            icon: ClipPolygon(
              sides: 6,
              borderRadius: 10,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return screens[2];
                      });
                },
                child: Container(
                  height: 55,
                  width: 55,
                  color: _index == 2
                      ? ColorRes.appBlue
                      : ColorRes.appWhite,
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color: ColorRes.appWhite,
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

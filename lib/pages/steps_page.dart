// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../pages/hajj_page.dart';
import '../pages/umrah_page.dart';
import '../widgets/headerTajawal.dart';
import '../widgets/navigation_drawer.dart';

import '../constants/model_theme.dart';

class StepsPage extends StatefulWidget {
  StepsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StepsPage> createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final box = GetStorage();

  late double _font;

  @override
  void initState() {
    super.initState();

    readSettingsData();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: const NavigationDrawerx(),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      icon: Icon(Icons.menu),
                      iconSize: 32,
                      tooltip: "openmenu".tr(),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 35,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                        ),
                        tooltip: "goback".tr(),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  isDarkMode
                      ? 'assets/images/ImageDark.png'
                      : 'assets/images/Image.png',
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    HeaderText("stepsheader".tr(), getFontSize(Header2),
                        FontWeight.w700),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HajjPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffCACACA),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              label: Text(
                                'hajj'.tr(),
                                style: GoogleFonts.tajawal(
                                    fontSize: getFontSize(body),
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              icon: Icon(
                                // <-- Icon
                                Icons.arrow_right,
                                size: getFontSize(Header4),
                                color: Colors.black,
                              ), // <-- Text
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UmrahPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffCACACA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            label: Text(
                              'umrah'.tr(),
                              style: GoogleFonts.tajawal(
                                  fontSize: getFontSize(body),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            icon: Icon(
                              // <-- Icon
                              Icons.arrow_right,
                              size: getFontSize(Header4),
                              color: Colors.black,
                            ), // <-- Text
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    HeaderText("selectdesiredpath".tr(), getFontSize(Header4),
                        FontWeight.w600),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  double getFontSize(double size) {
    if (box.read("font") == null) {
      return size;
    } else {
      return (_font * (size / 40));
    }
  }

  void readSettingsData() {
    var fontValue = box.read("font");
    if (fontValue != null && fontValue is double) {
      _font = fontValue;
    }
  }
}

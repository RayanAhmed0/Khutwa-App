// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last, unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/constants.dart';
import '../pages/steps_page.dart';
import '../widgets/headerTajawal.dart';
import '../widgets/navigation_drawer.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../constants/model_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = GetStorage();
  late double _font;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []); // to hide the status bar top and bottom
    setState(() {
      readSettingsData();
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          key: _scaffoldKey,
          drawer: const NavigationDrawerx(),
          body: Column(
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
                  IconButton(
                    onPressed: () {
                      launch("tel://911");
                    },
                    icon: Icon(
                      Icons.emergency,
                      color: Colors.red,
                      size: 30,
                    ),
                  )
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
                  HeaderText(
                    "welcome".tr(),
                    getFontSize(
                        Header), //40 1 is max font size / default font size
                    FontWeight.w700,
                  ), // welcome from json
                  HeaderText(
                      "aboutshort".tr(),
                      getFontSize(Header3),
                      //28 0.7 is max font size / default font size
                      FontWeight.w400), // aboutshort from json
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: HeaderText(
                        "aboutshorthomepage".tr(),
                        getFontSize(body2) // 17/40
                        ,
                        FontWeight.w400),
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      TextButton(
                        onPressed: () async {},
                        child: HeaderText("getapermit".tr(), getFontSize(body2),
                            FontWeight.w600),
                      ),
                    ],
                  ),
                  Container(
                    width: 350,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff007AFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StepsPage(),
                          ),
                        );
                      },
                      child: HeaderText(
                          "continue".tr(), getFontSize(body2), FontWeight.w400),
                    ),
                  )
                ],
              )
            ],
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

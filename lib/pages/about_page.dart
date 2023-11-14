// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last, unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../widgets/headerTajawal.dart';
import '../widgets/navigation_drawer.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;

import '../constants/model_theme.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: const NavigationDrawerx(),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SingleChildScrollView(
            child: Container(
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
                    ],
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      HeaderText("aboutheader".tr(), getFontSize(Header),
                          FontWeight.w600),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // font size settings
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: HeaderText("whatistheapp".tr(),
                                        getFontSize(Header3), FontWeight.w800)),
                                SizedBox(
                                  height: 10,
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    "about".tr(),
                                    style: GoogleFonts.tajawal(
                                      fontSize: getFontSize(body),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        // appearance settings
                        Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                    alignment: Alignment.center,
                                    child: HeaderText("whatisourgoal".tr(),
                                        getFontSize(Header3), FontWeight.w800)),
                                SizedBox(
                                  height: 10,
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    "goal".tr(),
                                    style: GoogleFonts.tajawal(
                                      fontSize: getFontSize(body),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ), // language settings
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: HeaderText("forcontact".tr(),
                                        getFontSize(Header3), FontWeight.w800)),
                                SizedBox(
                                  height: 10,
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    "contactbody".tr(),
                                    style: GoogleFonts.tajawal(
                                      fontSize: getFontSize(body),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
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

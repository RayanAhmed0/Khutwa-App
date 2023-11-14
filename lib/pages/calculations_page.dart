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

class CalculationsPage extends StatefulWidget {
  const CalculationsPage({Key? key}) : super(key: key);

  @override
  State<CalculationsPage> createState() => _CalculationsPageState();
}

class _CalculationsPageState extends State<CalculationsPage> {
  final box = GetStorage();

  late double _font;
  int DuaaCounter = 0;
  int TawafCounter = 0;
  int SafaMarwaCounter = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []); // to hide the status bar top and bottom
    setState(() {
      readSettingsData();
      readCalcData(); // for the calculator data
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
                      HeaderText("calculationsHeader".tr(), getFontSize(Header),
                          FontWeight.w600),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 200.0),
                            child: Column(
                              children: [
                                HeaderText("DuaCounter".tr(), getFontSize(body),
                                    FontWeight.w500),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: HeaderText(
                                            "$DuaaCounter",
                                            getFontSize(Header),
                                            FontWeight.w500)),
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            DuaaCounter++;
                                            box.write(
                                                "DuaaCounter", DuaaCounter);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Color.fromARGB(145, 20, 20, 20),
                                  thickness: 3,
                                  indent: 35,
                                  endIndent: 35,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 200.0),
                            child: Column(
                              children: [
                                HeaderText("TawafCounter".tr(),
                                    getFontSize(body), FontWeight.w500),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: HeaderText(
                                            "$TawafCounter",
                                            getFontSize(Header),
                                            FontWeight.w500)),
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (TawafCounter < 7) {
                                              TawafCounter++;
                                            }
                                            box.write(
                                                "TawafCounter", TawafCounter);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Color.fromARGB(145, 20, 20, 20),
                                  thickness: 3,
                                  indent: 35,
                                  endIndent: 35,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 200.0),
                            child: Column(
                              children: [
                                HeaderText("SafaMarwaCounter".tr(),
                                    getFontSize(body), FontWeight.w500),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: HeaderText(
                                            "$SafaMarwaCounter",
                                            getFontSize(Header),
                                            FontWeight.w500)),
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (SafaMarwaCounter < 7) {
                                              SafaMarwaCounter++;
                                            }
                                            box.write("SafaMarwaCounter",
                                                SafaMarwaCounter);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Color.fromARGB(145, 20, 20, 20),
                                  thickness: 3,
                                  indent: 35,
                                  endIndent: 35,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            DuaaCounter = 0;
                            box.remove('DuaaCounter');
                            TawafCounter = 0;
                            box.remove('TawafCounter');
                            SafaMarwaCounter = 0;
                            box.remove('SafaMarwaCounter');
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffCACACA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        label: Text(
                          'reset'.tr(),
                          style: GoogleFonts.tajawal(
                              fontSize: getFontSize(body2),
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        icon: Icon(
                          // <-- Icon
                          Icons.restart_alt,
                          size: 24,
                          color: Colors.black,
                        ), // <-- Text
                      ),
                    ],
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

  void readCalcData() {
    if (box.read("DuaaCounter") == null) {
      DuaaCounter = 0;
    } else {
      DuaaCounter = box.read("DuaaCounter");
    }
    if (box.read("TawafCounter") == null) {
      TawafCounter = 0;
    } else {
      TawafCounter = box.read("TawafCounter");
    }
    if (box.read("SafaMarwaCounter") == null) {
      SafaMarwaCounter = 0;
    } else {
      SafaMarwaCounter = box.read("SafaMarwaCounter");
    }
  }
}

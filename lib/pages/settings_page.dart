// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last, unused_local_variable, deprecated_member_use

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../constants/model_theme.dart';
import '../widgets/headerTajawal.dart';
import '../widgets/navigation_drawer.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final box = GetStorage();
  late double _font = 18;
  // will be ignored as the initState will read the settings data
  bool isShowDialog = false;
  double _currentSliderValue = 40;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []); // to hide the status bar top and bottom
    setState(() {
      readSettingsData();
      if (_font != null) {
        _currentSliderValue = _font;
      } else {
        _currentSliderValue = 40;
      }
    });
  }

  bool isSwitched = true;

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
                      HeaderText("settings".tr(), getFontSize(Header),
                          FontWeight.w600),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // font size settings
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 200.0),
                        child: Column(
                          children: [
                            HeaderText("settingfontsize".tr(),
                                getFontSize(Header4), FontWeight.w500),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: HeaderText("fontSizeSmall".tr(),
                                      getFontSize(body2), FontWeight.w700),
                                ),
                                Expanded(
                                  child: HeaderText("fontSizeLarge".tr(),
                                      getFontSize(Header3), FontWeight.w700),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Slider(
                                    value: _currentSliderValue,
                                    min: 16,
                                    max: 40,
                                    divisions: 6,
                                    label:
                                        _currentSliderValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        _currentSliderValue = value;
                                        _font = value;
                                        box.write("font", _font);
                                        _currentSliderValue = box.read("font");
                                        Future.delayed(
                                          const Duration(milliseconds: 2000),
                                          () {
                                            if (!isShowDialog) {
                                              AlertDialog(context);
                                              isShowDialog = true;
                                            }
                                          },
                                        );
                                      });
                                    },
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
                  // appearance settings
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 200.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            HeaderText("settingappearance".tr(),
                                getFontSize(Header4), FontWeight.w500),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Transform.scale(
                                      scale: 1.2,
                                      child: IconButton(
                                          icon: Icon(themeNotifier.isDark
                                              ? Icons.nightlight_outlined
                                              : Icons.light_mode),
                                          onPressed: () {
                                            themeNotifier.isDark
                                                ? themeNotifier.isDark = false
                                                : themeNotifier.isDark = true;
                                            Future.delayed(
                                              const Duration(
                                                  milliseconds: 2000),
                                              () {
                                                if (!isShowDialog) {
                                                  AlertDialog(context);
                                                  isShowDialog = true;
                                                }
                                              },
                                            );
                                          })),
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
                  ), // language settings
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200.0),
                        child: Column(
                          children: [
                            HeaderText("language".tr(), getFontSize(Header4),
                                FontWeight.w500),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                //arabic
                                setState(() {
                                  context.setLocale(Locale("ar", "SA"));
                                  Future.delayed(
                                    const Duration(milliseconds: 2000),
                                    () {
                                      if (!isShowDialog) {
                                        AlertDialog(context);
                                        isShowDialog = true;
                                      }
                                    },
                                  );
                                });
                              },
                              child: HeaderText("العربية", getFontSize(body),
                                  FontWeight.w400),
                            ),
                            TextButton(
                                onPressed: () {
                                  //english
                                  setState(() {
                                    context.setLocale(Locale("en", "US"));
                                    Future.delayed(
                                      const Duration(milliseconds: 2000),
                                      () {
                                        if (!isShowDialog) {
                                          AlertDialog(context);
                                          isShowDialog = true;
                                        }
                                      },
                                    );
                                  });
                                },
                                child: HeaderText("English", getFontSize(body),
                                    FontWeight.w400)),
                            Divider(
                              color: Color.fromARGB(145, 20, 20, 20),
                              thickness: 3,
                              indent: 35,
                              endIndent: 35,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
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

  AwesomeDialog AlertDialog(BuildContext context) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      btnOkIcon: Icons.restart_alt,
      btnCancelIcon: Icons.cancel,
      animType: AnimType.scale,
      title: 'attention'.tr(),
      desc: "attentionBody".tr(),
      buttonsTextStyle:
          GoogleFonts.tajawal(fontWeight: FontWeight.w600, color: Colors.black),
      btnOkColor: Color(0xffCACACA),
      btnCancelColor: Color(0xffCACACA),
      descTextStyle: GoogleFonts.tajawal(
        fontSize: body,
        fontWeight: FontWeight.w600,
      ),
      titleTextStyle: GoogleFonts.tajawal(
        fontSize: body,
        fontWeight: FontWeight.w600,
      ),
      btnOkText: "restart".tr(),
      btnCancelText: "ignore".tr(),
      btnCancelOnPress: () {},
      onDismissCallback: (type) {
        isShowDialog = false;
      },
    )..show();
  }
}

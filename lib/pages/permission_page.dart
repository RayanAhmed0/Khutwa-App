// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../constants/constants.dart';
import '../constants/model_theme.dart';
import '../widgets/headerTajawal.dart';
import '../widgets/navigation_drawer.dart';
import 'steps_page.dart';

TextEditingController permissionController = new TextEditingController();
String value = permissionController.text;
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class PermissionPage extends StatefulWidget {
  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
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
            child: SingleChildScrollView(
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
                      HeaderText("verifypermit".tr(), getFontSize(Header2),
                          FontWeight.w700),
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
                        child: HeaderText("aboutshortverifypage".tr(),
                            getFontSize(body2), FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        width: 350,
                        child: TextField(
                          controller: permissionController,

                          // obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.blueGrey),
                              ),
                              contentPadding: EdgeInsets.all(0),
                              hintText: 'hintenterpermits'.tr(),
                              hintStyle:
                                  TextStyle(fontSize: getFontSize(body2))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 350,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff007AFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StepsPage()),
                            );
                          },
                          child: Text(
                            "continue".tr(),
                            style: GoogleFonts.tajawal(
                                textStyle:
                                    TextStyle(fontSize: getFontSize(body2)),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
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
}

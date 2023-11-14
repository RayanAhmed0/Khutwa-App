// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import 'dua_page.dart';
import '../widgets/headerTajawal.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../constants/model_theme.dart';
import '../widgets/navigation_drawer.dart';
import 'Imageviews/image_10.dart';
import 'Imageviews/images.dart';

class UmrahPage extends StatefulWidget {
  const UmrahPage({Key? key}) : super(key: key);

  @override
  State<UmrahPage> createState() => _UmrahPageState();
}

int index = 0;
int arrayRange = umrahSteps.length;
var umrahSteps = [
  "umrahStep1".tr(),
  "umrahStep2".tr(),
  "umrahStep3".tr(),
  "umrahStep4".tr(),
  "umrahStep5".tr(),
  "umrahStep6".tr(),
  "umrahStep7".tr(),
  "umrahStep8".tr(),
  "umrahStep9".tr(),
];

class _UmrahPageState extends State<UmrahPage> {
  var num_steps = 9;
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
    int counter = index + 1;

    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: const NavigationDrawerx(),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: HeaderText(
                        "$counter", getFontSize(body), FontWeight.w400),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: LinearProgressIndicator(
                  value: (index / arrayRange),
                  color: Colors.white,
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: HeaderText(
                        umrahSteps[index], getFontSize(body2), FontWeight.w900),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 10),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            if (index != 0) {
                              // num of steps = 6 , max index in array = 5
                              index--;
                            } else {
                              index = 0;
                              ;
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffCACACA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        label: Text(
                          'previous'.tr(),
                          style: GoogleFonts.tajawal(
                              fontSize: getFontSize(body2),
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        icon: Icon(
                          // <-- Icon
                          Icons.arrow_left,
                          size: 24.0,
                          color: Colors.black,
                        ), // <-- Text
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                            ),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 300,
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    // textbutton for images
                                    TextButton.icon(
                                      onPressed: () {
                                        switch (index) {
                                          case 0:
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image8Page()),
                                            );
                                            break;
                                          case 1:
                                          case 2:
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image7Page()),
                                            );
                                            break;
                                          case 3:
                                          case 5:
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image7Page()),
                                            );
                                            break;
                                          case 4:
                                          case 6:
                                          case 7:
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image6Page()),
                                            );
                                            break;
                                          case 8:
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image10Page()),
                                            );
                                            break;
                                        }
                                      },
                                      icon: Icon(Icons.image),
                                      label: HeaderText(
                                          "location/steppicture".tr(),
                                          getFontSize(body),
                                          FontWeight.w600),
                                    ),
                                    // textbutton for location
                                    TextButton.icon(
                                      onPressed: () {
                                        switch (index) {
                                          case 0:
                                          case 1:
                                          case 2:
                                            Navigator.pop(context);
                                            var googleURL =
                                                "https://goo.gl/maps/6UZazMKSRf9KUGpx6";
                                            launchUrlString(googleURL);
                                            break;
                                          case 3:
                                          case 4:
                                            Navigator.pop(context);
                                            var googleURL =
                                                "https://goo.gl/maps/jJgpwX2WhZnrYVKx9";
                                            launchUrlString(googleURL);
                                            break;
                                          case 5:
                                            Navigator.pop(context);
                                            var googleURL =
                                                "https://goo.gl/maps/aXo2cacYK5GXJ6h59";
                                            launchUrlString(googleURL);
                                            break;
                                        }
                                      },
                                      icon: Icon(Icons.location_pin),
                                      label: HeaderText("steplocation".tr(),
                                          getFontSize(body), FontWeight.w600),
                                    ),
                                    // textbutton for video
                                    TextButton.icon(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        var videoURL =
                                            "https://youtu.be/IUjFKJGa9Jw?t=1";
                                        launchUrlString(videoURL);
                                      },
                                      icon: Icon(Icons.play_circle),
                                      label: HeaderText("guidevideo".tr(),
                                          getFontSize(body), FontWeight.w600),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DuaPage()),
                                        );
                                      },
                                      icon: Icon(Icons.import_contacts),
                                      label: HeaderText("duas".tr(),
                                          getFontSize(body), FontWeight.w600),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(0),
                          backgroundColor: Colors.transparent,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 78, 77, 77),
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 20, bottom: 10),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              if (index != arrayRange - 1) {
                                index++;
                              } else {
                                index = 0;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffCACACA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          label: Text(
                            'next'.tr(),
                            style: GoogleFonts.tajawal(
                                fontSize: getFontSize(body2),
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          icon: Icon(
                            // <-- Icon
                            Icons.arrow_left,
                            size: 24.0,
                            color: Colors.black,
                          ), // <-- Text
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
    _font = box.read("font");
  }
}

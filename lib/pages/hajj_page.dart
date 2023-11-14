// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../pages/dua_page.dart';
import '../widgets/headerTajawal.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../constants/constants.dart';
import '../constants/model_theme.dart';
import '../widgets/navigation_drawer.dart';
import 'Imageviews/image_10.dart';
import 'Imageviews/images.dart';

class HajjPage extends StatefulWidget {
  const HajjPage({Key? key}) : super(key: key);

  @override
  State<HajjPage> createState() => _HajjPageState();
}

int index = 0;
int arrayRange = hajjSteps.length;
var hajjSteps = [
  "hajjStep1".tr(),
  "hajjStep2".tr(),
  "hajjStep3".tr(),
  "hajjStep4".tr(),
  "hajjStep5".tr(),
  "hajjStep6".tr(),
  "hajjStep7".tr(),
  "hajjStep8".tr(),
  "hajjStep9".tr(),
  "hajjStep10".tr(),
  "hajjStep11".tr(),
  "hajjStep12".tr(),
  "hajjStep13".tr(),
  "hajjStep14".tr(),
  "hajjStep15".tr(),
  "hajjStep16".tr(),
  "hajjStep17".tr(),
  "hajjStep18".tr(),
  "hajjStep19".tr(),
  "hajjStep20".tr(),
  "hajjStep21".tr(),
  "hajjStep22".tr(),
  "hajjStep23".tr(),
  "hajjStep24".tr(),
  "hajjStep25".tr(),
  "hajjStep26".tr(),
  "hajjStep27".tr(),
  "hajjStep28".tr(),
  "hajjStep29".tr(),
  "hajjStep30".tr(),
  "hajjStep31".tr(),
  "hajjStep32".tr(),
  "hajjStep33".tr(),
];

class _HajjPageState extends State<HajjPage> {
  var num_steps = 33;
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
                        hajjSteps[index], getFontSize(body2), FontWeight.w900),
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
                          size: 24,
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
                                          case 1:
                                          case 2:
                                          case 3:
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Image8Page()));
                                            break;

                                          case 4:
                                          case 5:
                                          case 19:
                                          case 20:
                                          case 29:
                                          case 30:
                                          case 31:
                                          case 32:
                                            Navigator.pop(context);
                                            Navigator.pop(context);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image7Page()),
                                            );
                                            break;
                                          case 6:
                                          case 22:
                                          case 23:
                                          case 24:
                                          case 27:
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image3Page()),
                                            );
                                            break;
                                          case 7:
                                          case 8:
                                          case 9:
                                          case 10:
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image1Page()),
                                            );
                                            break;
                                          case 11:
                                          case 12:
                                          case 13:
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image2Page()),
                                            );
                                            break;
                                          case 16:
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image10Page()),
                                            );
                                            break;
                                          case 14:
                                          case 15:
                                          case 17:
                                          case 25:
                                          case 26:
                                          case 28:
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image5Page()),
                                            );
                                            break;
                                          case 18:
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image4Page()),
                                            );
                                            break;
                                          case 21:
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Image6Page()),
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
                                            Navigator.pop(context);
                                            var googleURL =
                                                "https://goo.gl/maps/2yQEDx7gwPMVXawQ7"; //7-8الكعبة
                                            launchUrlString(googleURL);
                                            break;
                                          case 2:
                                          case 3:
                                          case 4:
                                          case 5:
                                          case 19:
                                          case 20:
                                          case 29:
                                          case 30:
                                          case 31:
                                          case 32:
                                            Navigator.pop(context);
                                            var googleURL =
                                                "https://goo.gl/maps/2yQEDx7gwPMVXawQ7"; //الكعبة 7-8
                                            launchUrlString(googleURL);
                                            break;
                                          case 6:
                                          case 22:
                                          case 23:
                                          case 24:
                                          case 27:
                                            Navigator.pop(context);
                                            var googleURL =
                                                "https://goo.gl/maps/z8arecVEscRuuUEX8"; //منى 3
                                            launchUrlString(googleURL);
                                            break;
                                          case 7:
                                          case 8:
                                          case 9:
                                          case 10:
                                            Navigator.pop(context);
                                            var googleURL =
                                                "https://goo.gl/maps/CH5kP3VLsHx5TFWn6"; //عرفة 1
                                            launchUrlString(googleURL);
                                            break;
                                          case 11:
                                          case 12:
                                          case 13:
                                            Navigator.pop(context);
                                            var googleURL =
                                                "https://goo.gl/maps/fWAHMRG6shVGMsV46"; // مزدلفة 2
                                            launchUrlString(googleURL);
                                            break;
                                          case 14:
                                          case 15:
                                          case 16:
                                          case 17:
                                          case 25:
                                          case 26:
                                          case 28:
                                            Navigator.pop(context);
                                            var googleURL =
                                                "https://goo.gl/maps/nkow5suSbNcMgNEUA"; // الجمرات 5
                                            launchUrlString(googleURL);
                                            break;
                                          case 18:
                                            Navigator.pop(context);
                                            var googleURL =
                                                "https://goo.gl/maps/2yQEDx7gwPMVXawQ7"; // الكعبة
                                            launchUrlString(googleURL);
                                            break;
                                          case 21:
                                            Navigator.pop(context);
                                            var googleURL =
                                                "https://goo.gl/maps/MYwfJEgvmEKd7daz9"; //المسعى
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
                                            "https://youtu.be/hb2KwtxJpj8";
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
                            size: 24,
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
    var fontValue = box.read("font");
    if (fontValue != null && fontValue is double) {
      _font = fontValue;
    }
  }
}

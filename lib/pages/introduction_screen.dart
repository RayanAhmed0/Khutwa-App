// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../pages/home_page.dart';
import '../widgets/headerTajawal.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;

import '../constants/model_theme.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []); // to hide the status bar top and bottom
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Container(
            // padding: const EdgeInsets.only(bottom: 80),
            child: PageView(
              controller: controller,
              children: [
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Center(
                          child: Image.asset(
                            isDarkMode
                                ? 'assets/images/ImageDark.png'
                                : 'assets/images/Image.png',
                          ),
                        ),
                      ),
                    ),
                    HeaderText("appname".tr(), 35, FontWeight.w500),
                    SizedBox(
                      height: 20,
                    ),
                    HeaderText("aboutshort".tr(), 28, FontWeight.w400),
                    SizedBox(
                      height: 20,
                    ),
                    HeaderText("intro/nextorswipe".tr(), 20, FontWeight.w300),
                  ],
                ),

                ////////////////////////////////////////////
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Center(
                              child: Image.asset(
                                isDarkMode
                                    ? 'assets/images/introguide/homeardark.png'
                                    : 'assets/images/introguide/homear.png',
                                width: 225,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: HeaderText(
                          //
                          "intro/caseofemergency".tr(),
                          20,
                          FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: HeaderText(
                          //
                          "intro/menu".tr(),
                          20,
                          FontWeight.w400),
                    ),
                  ],
                ),
                //////////////////////////////////////////

                //////////////////////////////////////////
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Center(
                          child: Image.asset(
                            isDarkMode
                                ? 'assets/images/ImageDark.png'
                                : 'assets/images/Image.png',
                          ),
                        ),
                      ),
                    ),
                    HeaderText("appname".tr(), 35, FontWeight.w500),
                    SizedBox(
                      height: 20,
                    ),
                    HeaderText("aboutshort".tr(), 28, FontWeight.w400),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff007AFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        child: HeaderText(
                          "continue".tr(),
                          18,
                          FontWeight.w400,
                        )),
                  ],
                ),
                //////////////////////////////////////////
              ],
            ),
          ),
          bottomSheet: Container(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: HeaderText("skip".tr(), 16, FontWeight.w600),
                ),
                Spacer(),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(
                      spacing: 16,
                      activeDotColor: Colors.white,
                    ),
                    onDotClicked: ((index) => controller.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut)),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: HeaderText("next".tr(), 16, FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

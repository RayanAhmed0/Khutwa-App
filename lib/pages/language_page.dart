import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import '../pages/introduction_screen.dart';
import '../widgets/headerTajawal.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:provider/provider.dart';

import '../constants/model_theme.dart';

class lang extends StatefulWidget {
  const lang({Key? key}) : super(key: key);

  @override
  State<lang> createState() => _langState();
}

class _langState extends State<lang> {
  final box = GetStorage();
  double _font =
      18; // will be ignored as the initState will read the settings data
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []); // to hide the status bar top and bottom
    readSettingsData();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Image.asset(
              isDarkMode
                  ? 'assets/images/ImageDark.png'
                  : 'assets/images/Image.png',
            ),
            SizedBox(
              height: 20,
            ),
            HeaderText("خطوة", 35, FontWeight.w500),
            HeaderText("Khutwa", 35, FontWeight.w500),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
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
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const IntroductionScreen()),
                              );
                              setState(() {
                                context.setLocale(Locale("ar", "SA"));
                              });
                            },
                            child: HeaderText("العربية", 25, FontWeight.w600),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const IntroductionScreen()),
                              );
                              setState(() {
                                context.setLocale(Locale("en", "US"));
                              });
                            },
                            child: HeaderText("English", 25, FontWeight.w600),
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
                Icons.language,
                color: Color.fromARGB(255, 78, 77, 77),
                size: 70,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            HeaderText("ابدأ", 30, FontWeight.w500),
            HeaderText("Begin", 30, FontWeight.w500),
          ],
        ),
      );
    });
  }

  void readSettingsData() {
    var fontValue = box.read("font");
    if (fontValue != null && fontValue is double) {
      _font = fontValue;
    }
  }
}

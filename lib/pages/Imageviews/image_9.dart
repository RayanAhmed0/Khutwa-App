import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../constants/model_theme.dart';

class Image9Page extends StatefulWidget {
  const Image9Page({super.key});

  @override
  State<Image9Page> createState() => _Image9PageState();
}

class _Image9PageState extends State<Image9Page> {
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
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 35,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
              ],
            ),
            Spacer(),
            Image.asset("assets/images/9.png"),
            Spacer(),
          ],
        ),
      );
    });
  }
}

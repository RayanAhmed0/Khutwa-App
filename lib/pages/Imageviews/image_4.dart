import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../constants/model_theme.dart';

class Image4Page extends StatefulWidget {
  const Image4Page({super.key});

  @override
  State<Image4Page> createState() => _Image4PageState();
}

class _Image4PageState extends State<Image4Page> {
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
            Image.asset("assets/images/4.png"),
            Spacer(),
          ],
        ),
      );
    });
  }
}

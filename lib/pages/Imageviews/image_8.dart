import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../constants/model_theme.dart';

class Image8Page extends StatefulWidget {
  const Image8Page({super.key});

  @override
  State<Image8Page> createState() => _Image8PageState();
}

class _Image8PageState extends State<Image8Page> {
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
            Image.asset("assets/images/8.png"),
            Spacer(),
          ],
        ),
      );
    });
  }
}

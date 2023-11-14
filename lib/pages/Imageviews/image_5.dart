import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../constants/model_theme.dart';

class Image5Page extends StatefulWidget {
  const Image5Page({super.key});

  @override
  State<Image5Page> createState() => _Image5PageState();
}

class _Image5PageState extends State<Image5Page> {
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
            Image.asset("assets/images/5.png"),
            Spacer(),
          ],
        ),
      );
    });
  }
}

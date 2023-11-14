// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'constants/model_theme.dart';
import 'pages/home_page.dart';
import 'pages/language_page.dart';
import 'package:provider/provider.dart';

void main() async {
  FlutterNativeSplash.removeAfter(initialization);
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale("ar", "SA"),
        Locale("en", "US"),
      ],
      saveLocale: true,
      fallbackLocale: Locale('ar', 'SA'),
      path: "assets/resources",
    ),
  );
}

Future initialization(BuildContext? context) async {
  await Future.delayed(
      Duration(seconds: 3)); // remove the splash screen after 3 sec
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
        return MaterialApp(
          title: 'Khutwa',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: [Locale('en', 'US'), Locale("ar", "SA")],
          locale: Locale(context.locale.languageCode),
          theme: ThemeData(
            brightness:
                themeNotifier.isDark ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor:
                themeNotifier.isDark ? Color(0xff303030) : Color(0xfff1d6cb),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor:
                  themeNotifier.isDark ? Color(0xff303030) : Color(0xfff1d6cb),
            ),
            colorScheme: themeNotifier.isDark
                ? ThemeData.dark().colorScheme.copyWith(secondary: Colors.white)
                : ThemeData.light()
                    .colorScheme
                    .copyWith(secondary: Colors.white),
          ),
          debugShowCheckedModeBanner: false,
          home: const lang(),
        );
      }),
    );
  }
}

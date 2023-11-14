import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/calculations_page.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:easy_localization/easy_localization.dart';

import '../pages/home_page.dart';
import '../pages/about_page.dart';
import '../pages/settings_page.dart';

class NavigationDrawerx extends StatelessWidget {
  const NavigationDrawerx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(),
          child: SizedBox(
            height: 800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildHeader(context),
                buildMenuItems(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(
              "home".tr(),
              style: GoogleFonts.tajawal(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          ListTile(
            //iconColor: Colors.red,
            leading: const Icon(Icons.location_pin),
            title: Text(
              "userlocation".tr(),
              style: GoogleFonts.tajawal(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              getLocationInformation();
            },
          ),
          ListTile(
            //iconColor: Colors.red,
            leading: const Icon(Icons.calculate),
            title: Text(
              "calculationsHeader".tr(),
              style: GoogleFonts.tajawal(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CalculationsPage(),
                ),
              );
            },
          ),
          const Divider(
            color: Colors.black45,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              "settings".tr(),
              style: GoogleFonts.tajawal(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(
              "menuabout".tr(),
              style: GoogleFonts.tajawal(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => About(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

void getLocationInformation() {
  _getCurrentLocation().then((value) {
    lat = '${value.latitude}';
    long = '${value.longitude}';
    // setState(() {
    //   locationMessage = 'Latitude:$lat\n Longitude: $long';
    // });
    _liveLocation();
    _openMap(lat, long);
  });
}

// String locationMessage = 'Current location of the user';
late String lat;
late String long;
//get current location
Future<Position> _getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location Services are disabled');
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Location permission are denied");
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error("Location permissions are ermanently denied");
  }
  return await Geolocator.getCurrentPosition();
}

void _liveLocation() {
  LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high, distanceFilter: 50);
  Geolocator.getPositionStream(locationSettings: locationSettings)
      .listen((Position position) {
    lat = position.latitude.toString();
    long = position.longitude.toString();
    // setState(() {
    //   locationMessage = 'Latitude:$lat ,\n Longitude: $long';
    // });
  });
}

// open the current location in google map
Future<void> _openMap(String lat, String long) async {
  String googleURL =
      "https://www.google.com/maps/search/?api=1&query=$lat,$long";
  await canLaunchUrlString(googleURL)
      ? await launchUrlString(googleURL)
      : throw "Could not launch $googleURL";
}

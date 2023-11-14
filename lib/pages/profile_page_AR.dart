// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

class profileAR extends StatefulWidget {
  const profileAR({super.key});

  @override
  State<profileAR> createState() => _profileARState();
}

class _profileARState extends State<profileAR> {
  final box = GetStorage();

  final _nameController = TextEditingController();
  String name = "";

  final _ageController = TextEditingController();
  String age = "";
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []); // to hide the status bar top and bottom
    setState(() {
      readProfileData();
    });
  }

  bool checkDataNull() {
    if (box.read("age") != null) {
      return false;
    } else {
      return true;
    }
  }

  bool disableVal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xfff1d6cb),
        ),
        child: Column(
          children: [
            Image.asset("assets/images/Image.png"),

            //name textfield

            SizedBox(
              height: 45,
              width: 350,
              child: TextField(
                enabled: disableVal,
                controller: _nameController,
                // obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                    ),
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'ادخل الاسم',
                    hintStyle: TextStyle(fontSize: 15)),
              ),
            ),
            //age textfield

            SizedBox(
              height: 45,
              width: 350,
              child: TextField(
                enabled: disableVal,
                keyboardType: TextInputType.number,
                controller: _ageController,
                // obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                    ),
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'ادخل العمر',
                    hintStyle: TextStyle(fontSize: 15)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //  HeaderText(name != null ? name : 'User', 25, FontWeight.w500),
            // HeaderText(age != null ? age : 'Age', 25, FontWeight.w500),
            //save button
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if ((disableVal == false)) {
                        disableVal = !disableVal;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 78, 77, 77),
                    size: 50,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_nameController.text.isNotEmpty &&
                        _ageController.text.isNotEmpty) {
                      box.write("name", _nameController.text);
                      box.write("age", _ageController.text);

                      setState(() {
                        // if ("name" != "" || "age" != "") {
                        //   isVisible = !isVisible;
                        // }
                        if ((disableVal == true)) {
                          disableVal = !disableVal;
                        }
                        readProfileData();
                      });
                      print("$name \n $age");
                    } else {
                      //show toast please enter values
                      // showToast();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Icon(
                    Icons.save,
                    color: Color.fromARGB(255, 78, 77, 77),
                    size: 50,
                  ),
                ),
              ],
            ),

            // ElevatedButton.icon(
            //   onPressed: () {
            //     box.write("name", _nameController.text);
            //     box.write("age", _ageController.text);
            //     setState(() {
            //       readProfileData();
            //       // if ("name" != "" || "age" != "") {
            //       //   isVisible = !isVisible;
            //       // }
            //     });
            //   },
            //   icon: Icon(Icons.edit),
            //   label: Text("حفظ/تعديل"),
            // ),

            //print button
            // ElevatedButton.icon(
            //   onPressed: () {
            //     // print(box.read("name"));

            //     setState(() {
            //       name = box.read("name");
            //     });
            //   },
            //   icon: Icon(Icons.save),
            //   label: Text("retrieve"),
            // ),
          ],
        ),
      ),
    );
  }

  void readProfileData() {
    name = box.read("name");
    age = box.read("age");
  }

  // void showToast() {
  //   Fluttertoast.showToast(
  //     msg: "يرجى ادخال الاسم والعمر",
  //     backgroundColor: Color.fromARGB(255, 179, 159, 151),
  //     textColor: Colors.black,
  //     fontSize: 20,
  //   );
  // }
}

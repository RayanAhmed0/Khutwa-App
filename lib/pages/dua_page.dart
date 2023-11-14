// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../constants/model_theme.dart';
import '../widgets/headerTajawal.dart';
import '../widgets/navigation_drawer.dart';

class DuaPage extends StatefulWidget {
  const DuaPage({Key? key}) : super(key: key);

  @override
  State<DuaPage> createState() => _DuaPageState();
}

int index = 0;
int arrayRange = dua.length;
var dua = [
  "  الدعاء المأثور الذي ورد في أدعية الطواف هو أن النبي صلى الله عليه وسلم كان يقول بين الركن اليماني والحجر الأسود ربنا آتنا في الدنيا حسنة وفي الآخرة حسنة وقنا عذاب النار. ",
  "    وورد عن الإمام الشافعي أنه كان يقول:  اللهم اجعله حجاً مبروراً وسعياً مشكوراً وذنباً مغفوراً ، هذا ورد عن بعض الصحابة أو نحو ذلك.",
  "    إنما هذه الأدعية التي يرددها الناس، بعضها أدعية مأثورة في غير الحج والعمرة مثل دعاء:  اللهم اقسم لي من خشيتك ما تحول به بيننا وبين معاصيك ومن طاعتك ما تبلغنا به جنتك  أو  اللهم أصلح لي ديني الذي هو عصمة أمري وأصلح لي دنياي التي فيها معاشي، وأصلح لي آخرتي التي إليها معادي ، وهناك أدعية كثيرة وردت في القرآن وفي السنة لا بأس بها في الطواف  ,",
  "    كل واحد مناله حاجات عند الله، يريد الرزق فيقول: يا رب ارزقني رزقاً واسعاً، يريد المغفرة فيقول: يا رب اغفر لي ذنوبي، يريد الدعاء للأولاد فيقول: اللهم ارزقني أولاد صالحين، يريد أن يتزوج فيقول: يا رب ارزقني الزوجة الصالحة، فكل واحد يعرف ماذا يريد من ربه، الأفضل أن يطلب المسلم بلسانه ، ولايجعل أحد يلقنه كلمات لايعلم عنها ، ولايتفاعل معها. ,",
  "    اللهم إني أسألك العفو والعافية في ديني ودنياي وأهلي ومالي . اللهم استر عوراتي, وآمن روعاتي اللهم احفظني من بين يدي ومن خلفي, وعن يميني وعن شمالي ومن فوقي , وأعوذ بعظمتك أن أغتال من تحتي.",
  "    اللهم عافني في بدني اللهم عافني في سمعي, اللهم عافني في بصري . لا إله إلا أنت . اللهم إني أعوذ بك من الكفر والفقر ومن عذاب القبر , لا إله إلا أنت.",
  "    اللهم أنت ربي لا إله إلا أنت خلقتني , وأنا عبدك , وأنا على عهدك ووعدك ما استطعت , أعوذ بك من شر ما صنعت , أبوء لك بنعمتك علي , وأبوء بذنبي , فاغفر لي , إنه لا يغفر الذنوب إلا أنت. ",
  "    اللهم إني أعوذ بك من الهم والحزن , وأعوذ بك من العجز والكسل , ومن البخل والجبن , وأعوذ بك من غلبة الدين , وقهر الرجال.",
  "    اللهم اجعل أول هذا اليوم صلاحا وأوسطه فلاحا , وآخره نجاحا , وأسألك خيري الدنيا والآخرة يا أرحم الراحمين.",
  "    اللهم إني أسألك الرضى بعد القضاء , وبرد العيش بعد الموت , ولذة النظر إلى وجهك الكريم , والشوق إلى لقائك , في غير ضراء مضرة , ولا فتنة مضلة , وأعوذ بك أن أَظلم أو أُظلم , أو أَعتدي أو يُعتدى علي , أو أكتسب خطيئة أو ذنبا لا تغفره. ",
  "    اللهم إني أعوذ بك أن أرد إلى أرذل العمر. ",
  "    اللهم اهدني لأحسن الأعمال والأخلاق لا يهدي لأحسنها إلا أنت . . واصرف عني سيئها لا يصرف عني سيئها إلا أنت.",
  "اللهم أصلح لي ديني , ووسع لي في داري وبارك لي في رزقي.",
  "    اللهم إني أعوذ بك من القسوة والغفلة والذلة والمسكنة وأعوذ بك من الكفر والفسوق والشقاق والسمعة والرياء . وأعوذ بك من الصمم والبكم والجذام وسيئ الأسقام. ",
  "    اللهم آت نفسي تقواها , وزكها , أنت خير من زكاها , أنت وليها ومولاها. ",
  "    اللهم إني أعوذ بك من علم لا ينفع , وقلب لا يخشع , ونفس لا تشبع , ودعوة لا يستجاب لها. ",
  "    اللهم إني أعوذ بك من شر ما عملت , ومن شر ما لم أعمل , وأعوذ بك من شر ما علمت , ومن شر ما لم أعلم.",
  "    اللهم إني أعوذ بك من زوال نعمتك , وتحول عافيتك , وفجاءة نقمتك , وجميع سخطك. ",
  "    اللهم إني أعوذ بك من الهدم والتردي ومن الغرق والحرق والهرم , وأعوذ بك من أن يتخبطني الشيطان عند الموت , وأعوذ بك من أن أموت لديغا , وأعوذ بك من طمع يهدي إلى طبع.",
  "    اللهم إني أعوذ بك من منكرات الأخلاق والأعمال والأهواء والأدواء , وأعوذ بك من غلبة الدين , وقهر العدو , وشماتة الأعداء.",
  "    اللهم أصلح لي ديني , الذي هو عصمة أمري , وأصلح لي دنياي التي فيها معاشي , وأصلح لي آخرتي , التي إليها معادي , واجعل الحياة زيادة لي في كل خير , واجعل الموت راحة لي من كل شر , رب أعني ولا تعن علي , وانصرني ولا تنصر علي , واهدني ويسر الهدى لي.",
  "    اللهم اجعلني ذكّارا لك , شكّارا لك , مطواعا لك , مخبتا إليك , أواها منيبا , رب تقبل توبتي , واغسل حوبتي , وأجب دعوتي , وثبت حجتي , واهد قلبي وسدد لساني , واسلل سخيمة صدري.",
  "    اللهم إني أسألك الثبات في الأمر, والعزيمة على الرشد , أسألك شكر نعمتك وحسن عبادتك , وأسألك قلبا سليما , ولسانا صادقا , وأسألك من خير ما تعلم , وأعوذ بك من شر ما تعلم , وأستغفرك مما تعلم , وأنت علام الغيوب.",
  "    اللهم ألهمني رشدي , وقني شر نفسي . اللهم إني أسألك فعل الخيرات وترك المنكرات , وحب المساكين , وأن تغفر لي وترحمني , وإذا أردت بعبادك فتنة , فتوفني إليك منها غير مفتون.",
  "    اللهم إني أسألك حبك , وحب من يحبك , وحب كل عمل يقربني إلى حبك.",
];

class _DuaPageState extends State<DuaPage> {
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
          body: Container(
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: HeaderText(
                      dua[index], getFontSize(body2), FontWeight.w900),
                ),
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    Directionality(
                      textDirection: TextDirection.rtl,
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
                            size: 24.0,
                            color: Colors.black,
                          ), // <-- Text
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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

import 'package:fitness/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../custom/CstAppbarWithtextimage.dart';
import '../custom/CustomButton.dart';
import '../custom/CustomText.dart';
import '../custom/Fonts.dart';
import '../utils/Demo_Localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {

  String? userName,userEmail;
  String? userId;

  @override
  void initState() {
    super.initState();
    getSharePreferences();
  }

  getSharePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString("userid");
      userName = prefs.getString("username");
      userEmail = prefs.getString("useremail");

    });
  }


  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'image': 'assets/images/f1row1.png',
      },
      {
        'image': 'assets/images/f1row2.png',
      },
      {
        'image': 'assets/images/f1row3.png',
      },
    ];
    final List<Map<String, dynamic>> itemsSecond = [
      {
        'image': 'assets/images/f1row3.png',
      },
      {
        'image': 'assets/images/srow2.png',
      },
      {
        'image': 'assets/images/f1row1.png',
      },
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 25),
                CstAppbarWithtextimage(
                  title: DemoLocalization.of(context)!.translate('Portfolio').toString(),//'Portfolio',
                  icon: Icons.arrow_back_ios,
                  // imageAsset: 'assets/images/editbtn.png',
                  // Uncomment this line to show the image
                  fontFamily: Fonts.arial,
                    onImageTap: (){

                    }
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/profilecircle.png'),
                  ),
                ),
                CustomText( text: userName.toString(),//"Rahul",
                    fontSize: 6,
                    color: FitnessColor.colortextselectbox,
                    fontWeight: FontWeight.bold,
                    fontFamily: Fonts.arial ),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    itemCount:3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      // final bool isSelected = index == selectedIndex;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // selectedIndex = index;
                          });
                        },
                        child: Center(
                          child: Container(
                            // color: Colors.red,
                            // width: 110,
                            height: 160,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                margin: const EdgeInsets.symmetric(vertical: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 4,
                                child: Image.asset(
                                  item['image'],
                                  width: MediaQuery.of(context).size.width/3.6,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                      // );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("assets/images/videoimage.png"),
                        Center(
                            child: Image.asset("assets/images/playicon.png")),
                      ],
                    ),
                  ),
                ),
                Container(
                  // color: Colors.red,
                  // width: 200,
                  height: 170,
                  child: ListView.builder(
                    itemCount: 3,
                    //  physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final itemSecond = itemsSecond[index];
                      // final bool isSelected = index == selectedIndex;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            //  selectedIndex = index;
                          });
                        },
                        child: Center(
                          child: Container(
                            // color: Colors.red,
                            // width: 110,
                            height: 160,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                margin: const EdgeInsets.symmetric(vertical: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  /*side: BorderSide(
                                      color: isSelected ? FitnessColor.coloroutlineborder : Colors.transparent,
                                      width: 2.0,
                                    )*/
                                ),
                                elevation: 4,
                                child: Image.asset(
                                  itemSecond['image'],
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width/3.6,
                                  // width: 110,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                      // );
                    },
                  ),
                ),
                Center(
                  child: CustomButton(
                    text: DemoLocalization.of(context)!.translate('ShareProfile').toString(),//'Share Profile',
                    fontFamily: Fonts.arial,
                    fontSize: 22,
                    color: FitnessColor.colorTextThird,
                    onPressed: () {
                      Get.to(() => const MainProfileScreen());
                      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => MainProfileScreen()));

                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

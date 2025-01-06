import 'package:fitness/Screens/question_answer_screen.dart';
import 'package:fitness/auth/LoginScreen.dart';
import 'package:fitness/auth/settings_page.dart';
import 'package:fitness/utils/Demo_Localization.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../custom/CustomButton.dart';
import '../custom/CustomText.dart';
import '../custom/Fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartNowProgram extends StatefulWidget {
  const StartNowProgram({super.key});

  @override
  State<StartNowProgram> createState() => _StartNowProgramState();
}

class _StartNowProgramState extends State<StartNowProgram> {
  @override

  getLanguageCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    languageCode = prefs.getString("languageCode");

  }
  String? languageCode;
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: isDarkMode ? FitnessColor.primary:FitnessColor.white,

      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                        width: 80,
                        height: 35,
                        text:DemoLocalization.of(context)!.translate('LOG_IN').toString(), onPressed: (){
                          Get.to(()=>const LoginScreen());
                    }, fontFamily: Fonts.arial),
                    CustomButton(
                      width: languageCode == null || languageCode!.isEmpty ? 70 : (languageCode == "ar" ? 70 : 140),
                      height: 35,
                      text: DemoLocalization.of(context)!.translate('Change_Language').toString(),
                      onPressed: () {
                        Get.to(() => const SettingsPage())?.then((value) async {
                             getLanguageCode();
                             setState(() {});
                        });
                      },
                      fontFamily: Fonts.arial,
                    )

                  ],
                ),
              ),
               SizedBox(height:MediaQuery.of(context).size.height*0.05),
              CustomText1(
                text:DemoLocalization.of(context)!.translate('Get_your_personal').toString(),
                fontSize: 7.0,
                textAlign: TextAlign.center,
                color: FitnessColor.colorTextFour,
                fontWeight: FontWeight.w400,
                fontFamily: Fonts.arial,
              ),

              const SizedBox(height: 12),
              CustomText1(
                text:DemoLocalization.of(context)!.translate('it just takes a minute.').toString(),
                fontSize: 4.5,
                color: FitnessColor.colorTextThird,
                fontWeight: FontWeight.normal,
                fontFamily: Fonts.arial,
              ),

              Center(
                child: Image.asset('assets/images/frame_get_start.png',width: MediaQuery.of(context).size.width/1.5,height: MediaQuery.of(context).size.height/2),
              ),
              //  const SizedBox(height: 18),
              SizedBox(height: screenSize.height/16),
              Center(
                child: CustomButton(
                  text:DemoLocalization.of(context)!.translate('STARTNOW').toString().toUpperCase(),
                  fontFamily:Fonts.arial,
                  fontSize: 22,
                  letterSpacing: 2.0,
                  color: FitnessColor.colorTextThird,
                  onPressed:(){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => const QuestionAnswerScreen()));

                  },
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ) ,
    );
  }
}



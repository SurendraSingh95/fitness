import 'package:fitness/PurChaseProgram/StartNowProgram.dart';
import 'package:fitness/auth/LoginScreen.dart';
import 'package:fitness/colors.dart';
import 'package:fitness/custom/CustomButton.dart';
import 'package:fitness/custom/CustomText.dart';
import 'package:fitness/utils/Demo_Localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom/Fonts.dart';
import 'package:get/get.dart';

class StartYourFitnessScreen extends StatefulWidget {
  const StartYourFitnessScreen({Key? key}) : super(key: key);

  @override
  State<StartYourFitnessScreen> createState() => _StartYourFitnessScreenState();
}

class _StartYourFitnessScreenState extends State<StartYourFitnessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessColor.white,
      bottomSheet:  CustomButton(

        height: 50,
        width:200,
        text: DemoLocalization.of(context)!.translate('Next').toString(), onPressed:(){
           Get.to(()=>const StartNowProgram());
          }, fontFamily:Fonts.arial,


        fontSize: 15,
      ),
      body: Column(

        children: [
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  width: 80,
                    height: 35,
                    text:DemoLocalization.of(context)!.translate('LOG_IN').toString(), onPressed: (){
                  Get.to(()=>const LoginScreen());
                }, fontFamily: Fonts.arial),
                Image.asset("assets/images/logo.png",height: 45, width: 45,),

              ],
            ),
          ),

          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText1(
              text:DemoLocalization.of(context)!.translate('Start_your_fitness').toString().toUpperCase(),
              fontSize: 8.0,
              textAlign: TextAlign.center,
              color: FitnessColor.colorTextFour,
              fontWeight: FontWeight.bold,
              fontFamily: Fonts.arial,
            ),
          ),
          const SizedBox(height: 20,),

          CustomButton(
            height: 50,
            width:200,
              text: DemoLocalization.of(context)!.translate('PURCHASE_PROGRAM').toString(), onPressed:(){
          }, fontFamily:Fonts.arial,


          fontSize: 15,
          ),
          const SizedBox(height: 20,),

          Image.asset("assets/images/start_logo.png",),



        ],
      ),
    );
  }
}


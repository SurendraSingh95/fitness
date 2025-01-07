import 'package:fitness/colors.dart';
import 'package:fitness/custom/CstAppbarWithtextimage.dart';
import 'package:fitness/custom/CustomText.dart';
import 'package:fitness/custom/Fonts.dart';
import 'package:fitness/utils/Demo_Localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class SelectTrainerScreen extends StatefulWidget {
  const SelectTrainerScreen({Key? key}) : super(key: key);

  @override
  State<SelectTrainerScreen> createState() => _SelectTrainerScreenState();
}

class _SelectTrainerScreenState extends State<SelectTrainerScreen> {
  String? selectedTrainer;

  List<String> trainers = ['Trainer 1', 'Trainer 2', 'Trainer 3', 'Trainer 4'];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? FitnessColor.primary : FitnessColor.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 0.0 ,top: 16),
              child: CstAppbarWithtextimage(
                  title: DemoLocalization.of(context)!.translate('Select_Trainer').toString(),
                  icon: Icons.arrow_back_ios,
                  fontFamily: Fonts.arial,
                  onImageTap: (){
                    Get.back();
                  }
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                value: selectedTrainer,
                hint:CustomText(text:  DemoLocalization.of(context)!.translate('Select_Trainer').toString(), fontSize: 5,fontFamily: Fonts.arial,color: isDarkMode ? FitnessColor.white : FitnessColor.primary ,),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTrainer = newValue;
                  });
                },
                items: trainers.map<DropdownMenuItem<String>>((String trainer) {
                  return DropdownMenuItem<String>(
                    value: trainer,
                    child: Text(
                      trainer,
                      style: TextStyle(color: isDarkMode ? FitnessColor.white : FitnessColor.primary),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // Display the selected trainer
            if (selectedTrainer != null)
              Text(
                'Selected Trainer: $selectedTrainer',
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode ? FitnessColor.white : FitnessColor.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

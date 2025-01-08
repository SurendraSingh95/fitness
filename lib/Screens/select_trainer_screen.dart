import 'package:fitness/Controllers/Question%20Controller/question_controller.dart';
import 'package:fitness/Screens/home_screen.dart';
import 'package:fitness/Screens/home_screen1.dart';
import 'package:fitness/Utils/utils.dart';
import 'package:fitness/colors.dart';
import 'package:fitness/custom/CstAppbarWithtextimage.dart';
import 'package:fitness/custom/CustomText.dart';
import 'package:fitness/custom/Fonts.dart';
import 'package:fitness/custom/my_shimmer.dart';
import 'package:fitness/utils/Demo_Localization.dart';
import 'package:fitness/utils/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectTrainerScreen extends StatefulWidget {
  const SelectTrainerScreen({Key? key}) : super(key: key);

  @override
  State<SelectTrainerScreen> createState() => _SelectTrainerScreenState();
}

class _SelectTrainerScreenState extends State<SelectTrainerScreen> {
  String? selectedTrainer;

  final QuestionController questionController = Get.put(QuestionController());

  @override
  void initState() {
    super.initState();
    get();
  }
  get() async {
    await questionController.getTrainerApi();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return RefreshIndicator(
      onRefresh: () async{
        questionController.getTrainerApi();
        setState(() {

        });
      },
      child: Scaffold(
        backgroundColor: isDarkMode ? FitnessColor.primary : FitnessColor.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, top: 16),
                child: CstAppbarWithtextimage(
                  title: DemoLocalization.of(context)!
                      .translate('Select_Trainer')
                      .toString(),
                  icon: Icons.arrow_back_ios,
                  fontFamily: Fonts.arial,
                  onImageTap: () {
                    Get.back();
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Use Expanded to give GridView constraints
              Expanded(
                child: Obx(() {
                  return
                    questionController.isLoading.value
                        ? myShimmerGrid()
                        : questionController.trainerList.isEmpty
                        ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: CustomText1(
                              text: DemoLocalization.of(context)!
                                  .translate('No_data_found')
                                  .toString(),
                              fontSize: 4)),
                    )
                        :
                    GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.0),
                    ),
                    itemCount: questionController.trainerList.length,
                    itemBuilder: (context, index) {
                      var item = questionController.trainerList[index];
                      return InkWell(
                        onTap:(){
                          SharedPref.setTrainerIdPrefs(item.id.toString());
                          SharedPref.setTrainerImagePrefs(item.profileImage.toString());
                          Get.to(()=> HomeScreen(trainerName:item.title,trainerImage: item.profileImage,trainerId: item.id,));
                        },
                        child: Card(
                          color:  FitnessColor.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            side: BorderSide(color: FitnessColor.colorsociallogintext)
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                    child: Image.network(
                                      item.profileImage ?? "",
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                      height: 120,
                                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Center(
                                            child:
                                              CupertinoActivityIndicator()
                                            // CircularProgressIndicator(
                                            //   value: loadingProgress.expectedTotalBytes != null
                                            //       ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                            //       : null,
                                            //
                                            // ),
                                          );
                                        }
                                      },

                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText1(
                                  text: item.title ?? "",
                                  fontSize: 3.5,
                                  fontFamily: Fonts.arial,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

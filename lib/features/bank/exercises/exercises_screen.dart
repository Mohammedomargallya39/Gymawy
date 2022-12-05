import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym/core/utils/colors_manager.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/widgets/myText.dart';
import 'package:gym/core/widgets/my_icon_button.dart';
import 'package:gym/features/bank/main_screen/main_screen.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: designApp,
          child: Column(
            children: [
              Row(
                children: [
                  DefaultIconButton(
                      icon:  Icon(
                        Icons.arrow_back_ios_new,
                        size: 16.sp,
                        color: ColorManager.iconColor,
                      ),
                      onPressed: () {
                        navigateTo(context, const MainScreen());
                      }),
                  const Expanded(
                      child: Center(
                          child: myText(title: 'Exercises', style: Style.large))),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  padding:  EdgeInsetsDirectional.only(bottom: 10.h),
                  itemBuilder:(context,index) => buildExercisesItems(),
                  separatorBuilder: (context,index) =>  SizedBox(height: 10.h,),
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExercisesItems() => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        child: Padding(
          padding:  EdgeInsets.all(10.0.sp),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: const Image(
                      image: AssetImage('assets/images/png/exercies.png'),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 15.0.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const myText(
                            title: 'Front Pullups', style: Style.small),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                myText(title: 'sets', style: Style.extraSmall),
                                myText(title: 'Reps', style: Style.extraSmall),
                                myText(title: 'Rest', style: Style.extraSmall),
                              ],
                            ),
                            space10Horizontal,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                myText(title: '3', style: Style.extraSmall),
                                myText(
                                    title: '12-10-8', style: Style.extraSmall),
                                myText(
                                    title: '30 sec', style: Style.extraSmall),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 1.h,
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: ColorManager.iconColor,
                      ),
                      space3Horizontal,
                      const myText(title: 'Mark as completed', style: Style.small)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

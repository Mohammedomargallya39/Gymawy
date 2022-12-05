import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym/core/cubit/bank_cubit/state.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/colors_manager.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/widgets/myText.dart';
import 'package:gym/core/widgets/my_icon_button.dart';
import 'package:gym/features/bank/main_screen/main_screen.dart';
import 'package:gym/gen/assets.gen.dart';

import '../../../core/cubit/bank_cubit/cubit.dart';
import '../main_screen/home_client/home_client.dart';
import 'exercise_type.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  late MainBloc cubit;
  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }

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
                  InkWell(
                      child: SvgPicture.asset(
                          Assets.images.svg.arrow_back
                      ),
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                  ),
                  const Expanded(
                      child: Center(
                          child: myText(
                            title: AppString.exercises, style: Style.large ,fontFamily: 'poppins',
                          )
                      )
                  ),
                ],
              ),
              space20Vertical,
              Expanded(
                child: ListView.builder(
                  itemBuilder:(context,index) => InkWell(
                      child: buildExercisesItems(),
                      onTap: ()
                      {
                        navigateTo(context, const ExerciseType());
                        debugPrintFullText('$index');
                      },
                  ),
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

  Widget buildExercisesItems() => BlocBuilder<MainBloc,MainState>(
    builder: (context, state) {
      return Card(
        color: const Color.fromARGB(255, 247, 248, 248),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.w, 10.h, 0 , 0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 76.h,
                    width: 79.w,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    child: SvgPicture.asset(
                      Assets.images.svg.exercise_photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 15.0.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const myText(
                          title: AppString.frontPullUps,
                          style: Style.small,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        space5Vertical,
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                myText(title: AppString.sets, style: Style.extraSmall, fontFamily: 'poppins',),
                                myText(title: AppString.reps, style: Style.extraSmall, fontFamily: 'poppins',),
                                myText(title: AppString.rest, style: Style.extraSmall, fontFamily: 'poppins',),
                              ],
                            ),
                            space10Horizontal,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                myText(title: '3', style: Style.extraSmall, fontFamily: 'poppins',),
                                myText(
                                  title: '12-10-8', style: Style.extraSmall, fontFamily: 'poppins',),
                                myText(
                                  title: '30 sec', style: Style.extraSmall, fontFamily: 'poppins',),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: ()
                      {
                        navigateTo(context, const ExerciseType());
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: const Color.fromARGB(255, 161, 175, 176),
                        size: 15.sp,
                      )
                  ),
                ],
              ),
              space10Vertical,
              Container(
                width: double.infinity,
                height: 1.h,
                color: Colors.grey.shade300,
              ),
              InkWell(
                onTap: ()
                {
                  cubit.changeCompleted();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cubit.isCompleted?
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(Assets.images.svg.circle),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.check,
                            color: Colors.grey.shade300,
                          ),
                        )
                      ],
                    ) : 
                    Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: SvgPicture.asset(Assets.images.svg.checked_icon),
                    ),
                    space3Horizontal,
                    myText(
                      title: cubit.isCompleted? AppString.markAsCompleted : AppString.completed,
                      style: Style.small,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'poppins',
                      color: cubit.isCompleted? const Color.fromARGB(255, 161, 175, 176) : Colors.green,
                    ),
                  ],
                )
                ,
              )
            ],
          ),
        ),
      );
    },

  );
}

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/utils/extension.dart';

import '../../../core/cubit/bank_cubit/cubit.dart';
import '../../../core/utils/appString.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/widgets/myButton.dart';
import '../../../core/widgets/myText.dart';
import '../../../gen/assets.gen.dart';

class ExerciseType extends StatefulWidget {
  const ExerciseType({Key? key}) : super(key: key);

  @override
  State<ExerciseType> createState() => _ExerciseTypeState();
}

class _ExerciseTypeState extends State<ExerciseType> {

  int selected = 0;
  late MainBloc cubit;
  List<TrainingImage> listTrainingImages = [
    TrainingImage(
      img: Assets.images.svg.client,
    ),
    TrainingImage(
      img: Assets.images.svg.coach,
    ),
  ];

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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                              title: AppString.benchPress, style: Style.large ,fontFamily: 'poppins',
                            )
                        )
                    ),
                  ],
                ),
                space20Vertical,
                SizedBox(
                  height: 220.h,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padEnds: false,
                    controller: PageController(
                      initialPage: selected,
                      viewportFraction: 0.95,
                      keepPage: true,
                    ),
                    allowImplicitScrolling: true,
                    pageSnapping: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(9.sp),
                        decoration: BoxDecoration(
                          boxShadow: [
                            // selected == index ?
                            BoxShadow(
                              color: Theme.of(context).primaryColor,
                              spreadRadius: 0,
                              blurRadius: 8,
                            )
                            // : const BoxShadow(),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: Colors.orange),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              ColorManager.whiteColor,
                              ColorManager.whiteColor,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                listTrainingImages[index].img,
                                height: 150.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount:  listTrainingImages.length ,
                  ),
                ),
                space30Vertical,
                const myText(
                    title: AppString.equipment,
                    style: Style.medium,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                ),
                space10Vertical,
                const myText(
                  title: AppString.barbell,
                  style: Style.small,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'poppins',
                ),
                space20Vertical,
                const myText(
                  title: AppString.target,
                  style: Style.medium,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins',
                ),
                space10Vertical,
                const myText(
                  title: AppString.chest,
                  style: Style.small,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'poppins',
                ),
                space20Vertical,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const myText(
                            title: AppString.sets,
                            style: Style.medium,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          space8Vertical,
                          const myText(
                            title: AppString.reps,
                            style: Style.medium,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          space8Vertical,
                          const myText(
                            title: AppString.rest,
                            style: Style.medium,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    space50Horizontal,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const myText(
                            title: '3',
                            style: Style.small,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w300,
                          ),
                          space8Vertical,
                          const myText(
                            title: '12-10-8',
                            style: Style.small,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w300,
                          ),
                          space8Vertical,
                          const myText(
                            title: '30 sec',
                            style: Style.small,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w300,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                space40Vertical,
                myButton(
                    elevation: 0.0,
                    textOnly: true,
                    height: context.heightScreenWithOutBottom * 0.08,
                    text: AppString.complete,
                    onPressed: () {
                      // navigateTo(context, PinPage());
                    }),
                space20Vertical,
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class TrainingImage extends Equatable {
  final String img;
  const TrainingImage(
      {required this.img});

  @override
  List<Object?> get props => [img];
}

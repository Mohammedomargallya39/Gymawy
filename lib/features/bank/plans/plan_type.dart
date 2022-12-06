import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym/core/utils/extension.dart';
import 'package:gym/core/widgets/back_button.dart';

import '../../../core/cubit/bank_cubit/cubit.dart';
import '../../../core/cubit/bank_cubit/state.dart';
import '../../../core/utils/appString.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/myButton.dart';
import '../../../core/widgets/myText.dart';
import '../../../gen/assets.gen.dart';

class PlanTypeScreen extends StatefulWidget {
  const PlanTypeScreen({Key? key}) : super(key: key);

  @override
  State<PlanTypeScreen> createState() => _PlanTypeScreenState();
}

class _PlanTypeScreenState extends State<PlanTypeScreen> {
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
                  DefaultBackButton(
                    function: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Expanded(
                      child: Center(
                          child: myText(
                    title: AppString.planType,
                    style: Style.large,
                    fontFamily: 'poppins',
                  ))),
                ],
              ),
              space20Vertical,
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                    child: buildPlansTypeItems(),
                    onTap: () {
                      //navigateTo(context, const ExerciseType());
                      debugPrintFullText('$index');
                    },
                  ),
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
              space20Vertical,
              myButton(
                text: AppString.delete,
                textOnly: true,
                color: const Color.fromARGB(255, 255, 0, 0),
                width: double.infinity,
                height: 50.h,
                radius: 40.h,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlansTypeItems() => BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Card(
              color: const Color.fromARGB(255, 247, 248, 248),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.w, 10.h, 0, 0),
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
                          padding: EdgeInsets.symmetric(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      myText(
                                        title: AppString.sets,
                                        style: Style.extraSmall,
                                        fontFamily: 'poppins',
                                      ),
                                      myText(
                                        title: AppString.reps,
                                        style: Style.extraSmall,
                                        fontFamily: 'poppins',
                                      ),
                                      myText(
                                        title: AppString.rest,
                                        style: Style.extraSmall,
                                        fontFamily: 'poppins',
                                      ),
                                    ],
                                  ),
                                  space10Horizontal,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      myText(
                                        title: '3',
                                        style: Style.extraSmall,
                                        fontFamily: 'poppins',
                                      ),
                                      myText(
                                        title: '12-10-8',
                                        style: Style.extraSmall,
                                        fontFamily: 'poppins',
                                      ),
                                      myText(
                                        title: '30 sec',
                                        style: Style.extraSmall,
                                        fontFamily: 'poppins',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: const Color.fromARGB(255, 161, 175, 176),
                              size: 15.sp,
                            )),
                      ],
                    ),
                    space10Vertical,
                  ],
                ),
              ),
            ),
          );
        },
      );
}

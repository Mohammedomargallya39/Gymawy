import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym/core/cubit/bank_cubit/state.dart';
import 'package:gym/core/widgets/myTextFill.dart';
import 'package:gym/features/bank/exercises/exercises_screen.dart';

import '../../../../core/cubit/bank_cubit/cubit.dart';
import '../../../../core/utils/appString.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/myText.dart';
import '../../../../gen/assets.gen.dart';

class HomeClientScreen extends StatefulWidget {
  const HomeClientScreen({Key? key}) : super(key: key);

  @override
  State<HomeClientScreen> createState() => _HomeClientScreenState();
}

class _HomeClientScreenState extends State<HomeClientScreen> {

  TextEditingController searchController = TextEditingController();
  late MainBloc cubit;
  int selected = 0;

  List<Suggestions> listSuggestions = [
    Suggestions(
      title: AppString.plans,
      img: Assets.images.svg.plans,
    ),
    Suggestions(
      title: AppString.exercise,
      img: Assets.images.svg.exercise,
    ),
    Suggestions(
      title: AppString.clients,
      img: Assets.images.svg.clients,
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: designApp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.images.svg.profile,
                      width: 80,
                      height: 80,
                    ),
                    const Spacer(),
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        SvgPicture.asset(
                          Assets.images.svg.notifications,
                          width: 25.w,
                          height: 30.h,
                        ),
                        Container(
                          height: 17.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(7.r)
                          ),
                          child: Center(
                            child: Text(
                                AppString.notificationsNum,
                                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                space20Vertical,
                Text(
                  AppString.helloClient,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 23.sp,
                  ),
                ),
                space8Vertical,
                Text(
                  AppString.ready,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                  ),
                ),
                space20Vertical,
                /// will change this raw
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: myTextFill(
                        controller: searchController,
                        hint: AppString.search,
                        hintStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: Colors.grey.shade400
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          size: 15.sp,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    space10Horizontal,
                    Padding(
                      padding: EdgeInsets.only(bottom: 14.h),
                      child: InkWell(
                        child: SvgPicture.asset(
                          Assets.images.svg.filterSearch,
                          height: 28.sp,
                          width: 28.sp,
                        ),
                        onTap: ()
                        {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return BlocBuilder<MainBloc,MainState>(
                                builder: (context, state) {
                                  return AlertDialog(
                                    shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    title: Column(
                                      children: [
                                        InkWell(
                                          onTap: ()
                                          {
                                            cubit.changeToCoachRadioButton();
                                          },
                                          child: SizedBox(
                                            height: 30.h,
                                            child: Row(
                                              children: [
                                                Text(
                                                  AppString.coaches,
                                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                                      fontFamily: 'poppins',
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  height: 10.h,
                                                  width: 10.w,
                                                  decoration: BoxDecoration(
                                                      color: cubit.coachRadioButton? const Color.fromARGB(255, 248, 96, 13) :
                                                      Colors.transparent,
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(color: Colors.grey)
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        space10Vertical,
                                        Container(
                                          width: double.infinity,
                                          height: 1.h,
                                          color: Colors.grey.shade300,
                                        ),
                                        space10Vertical,
                                        InkWell(
                                          onTap: ()
                                          {
                                            cubit.changeToClientRadioButton();
                                          },
                                          child: SizedBox(
                                            height: 30.h,
                                            child: Row(
                                              children: [
                                                Text(
                                                  AppString.clients,
                                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                                      fontFamily: 'poppins',
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  height: 10.h,
                                                  width: 10.w,
                                                  decoration: BoxDecoration(
                                                      color: cubit.clientRadioButton? const Color.fromARGB(255, 248, 96, 13) :
                                                      Colors.transparent,
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(color: Colors.grey)
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                space20Vertical,
                Text(
                  AppString.suggestions,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
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
                      viewportFraction: 0.45,
                      keepPage: true,
                    ),
                    allowImplicitScrolling: true,
                    pageSnapping: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
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
                                  listSuggestions[index].img,
                                  height: 150.h,
                                ),
                                space10Vertical,
                                myText(
                                  title: listSuggestions[index].title,
                                  style:Style.small,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),

                              ],
                            ),
                          ),
                        ),
                        onTap: ()
                        {
                          if(index == 0){

                          }else if (index == 1){
                            navigateTo(context, const ExercisesScreen());
                          }else{}
                        },
                      );
                    },
                    itemCount:  listSuggestions.length ,
                  ),
                ),
                space20Vertical,
                Text(
                  AppString.todaySession,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
                space5Vertical,
                Text(
                  AppString.doNotMiss,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 6.sp,
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 140.h,
                      decoration:  const BoxDecoration(
                        color: Color.fromARGB(255, 248, 96, 13),
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10.w, 7.h, 0, 5.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 30.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 252, 183, 146),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(
                                child: Text(
                                  AppString.daysNum,
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 9.sp,
                                  ),
                                ),
                              ),
                            ),
                            space5Vertical,
                            Text(
                              AppString.fullBodyExercise,
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 11.sp,
                              ),
                            ),
                            space3Vertical,
                            Text(
                              AppString.level,
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 6.sp,
                              ),
                            ),
                            space5Vertical,
                            Row(
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 252, 183, 146),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset( Assets.images.svg.clock),
                                        space5Horizontal,
                                        Text(
                                          AppString.clock,
                                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                space10Horizontal,
                                Container(
                                  height: 30.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 252, 183, 146),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset( Assets.images.svg.fire),
                                        space5Horizontal,
                                        Text(
                                          AppString.cal,
                                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            space5Vertical,
                            InkWell(
                              child: Container(
                                height: 30.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 0, 173, 199),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(
                                  child: Text(
                                    AppString.startNow,
                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.sp,
                                        color: const Color.fromARGB(255, 255, 255, 255)
                                    ),
                                  ),
                                ),
                              ),
                              onTap: ()
                              {

                              },
                            ),
                          ],
                        ),
                      ),

                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          90.w,
                          0,
                          0,
                          20.h
                      ),
                      child: SvgPicture.asset(
                        Assets.images.svg.client_section,
                        height: 250,
                      ),
                    ),
                  ],
                )
              ],
            )
          ),
        ),
      ),
    );
  }

}

class Suggestions extends Equatable {
  final String img;
  final String title;

  const Suggestions(
      {required this.img, required this.title});

  @override
  List<Object?> get props => [img, title];
}



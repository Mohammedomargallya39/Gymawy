import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/cubit/bank_cubit/cubit.dart';
import '../../../../core/cubit/bank_cubit/state.dart';
import '../../../../core/utils/appString.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/myTextFill.dart';
import '../../../../gen/assets.gen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchController = TextEditingController();
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
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 251, 239, 233),
                              borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0.sp),
                            child: Row(
                              children:  [
                                CircleAvatar(
                                  radius: 33.sp,
                                  backgroundImage: const NetworkImage(
                                      'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/238882960_1176013169492391_5072941271790244082_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=jbg7MdAH1BYAX9hvBtG&tn=Gfqn9JTXHm2lEL0j&_nc_ht=scontent-hbe1-1.xx&oh=00_AfAyStoSibMMjqEycQ6BwFJdCs_JNM8pgFlhOKqTO2KJqw&oe=63941FBE',

                                  ),
                                ),
                                space20Horizontal,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppString.resultSearchName,
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins',
                                      ),
                                    ),
                                    space3Vertical,
                                    Text(
                                      AppString.resultSearchType,
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins',
                                      ),
                                    ),
                                    space3Vertical,
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20.sp,
                                        ),
                                        space20Horizontal,
                                        Icon(
                                          Icons.location_on,
                                          size: 15.sp,
                                        ),
                                        Text(
                                          AppString.resultSearchLocation,
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'poppins',
                                          ),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

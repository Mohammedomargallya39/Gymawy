import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym/core/cubit/bank_cubit/state.dart';
import 'package:gym/core/widgets/myButton.dart';
import 'package:gym/core/widgets/myTextFill.dart';

import '../../../core/cubit/bank_cubit/cubit.dart';
import '../../../core/utils/appString.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/myText.dart';
import '../../../gen/assets.gen.dart';

class AddPlan extends StatefulWidget {
  const AddPlan({Key? key}) : super(key: key);

  @override
  State<AddPlan> createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {

  late MainBloc cubit;
  TextEditingController nameOfPlanController = TextEditingController();
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
          child: BlocBuilder<MainBloc,MainState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                title: AppString.addPlan, style: Style.large ,fontFamily: 'poppins',
                              )
                          )
                      ),
                    ],
                  ),
                  space100Vertical,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myTextFill(
                        controller: nameOfPlanController,
                        hint: AppString.nameOfPlan,
                        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: Colors.grey,
                            fontFamily: 'poppins'
                        ),
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'isEmpty';
                          }
                        },

                      ),
                      space30Vertical,
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppString.visibility,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                  fontFamily: 'poppins'
                              ),
                            ),
                            const Spacer(),

                            InkWell(
                              child: SvgPicture.asset(
                                  cubit.isVisibilityPlanIcon!?
                                  Assets.images.svg.visibility_false : Assets.images.svg.visibility_true
                              ),
                              onTap: ()
                              {
                                cubit.visibilityPlan();
                              },
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40.h),
                    child: myButton(
                        text: AppString.next,
                        height: 50.h,
                        textOnly: true,
                        onPressed: ()
                        {

                        },

                    ),
                  )

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

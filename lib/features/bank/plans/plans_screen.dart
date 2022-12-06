import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym/core/widgets/back_button.dart';
import 'package:gym/features/bank/plans/plan_type.dart';

import '../../../core/cubit/bank_cubit/cubit.dart';
import '../../../core/cubit/bank_cubit/state.dart';
import '../../../core/utils/appString.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/myText.dart';
import 'add_plan.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultBackButton(
                    function: () {
                      Navigator.pop(context);
                    },
                  ),
                  space70Horizontal,
                  const Expanded(
                      child: Center(
                          child: myText(
                    title: AppString.plans,
                    style: Style.large,
                    fontFamily: 'poppins',
                  ))),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sh),
                      color: Colors.green,
                    ),
                    child: IconButton(
                        onPressed: () {
                          navigateTo(context, const AddPlan());
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              space20Vertical,
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                    child: buildPlansItems(),
                    onTap: () {
                      navigateTo(context, const PlanTypeScreen());
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

  Widget buildPlansItems() => BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Card(
              color: const Color.fromARGB(255, 247, 248, 248),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(15.h),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.planType,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w400),
                        ),
                        space10Vertical,
                        Row(
                          children: [
                            Text(
                              AppString.visibility,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w300),
                            ),
                            space5Horizontal,
                            Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.red,
                              size: 15.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: const Color.fromARGB(255, 210, 210, 210),
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}

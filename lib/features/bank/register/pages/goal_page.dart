import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/colors_manager.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/utils/extension.dart';
import 'package:gym/core/widgets/myElevatedButton.dart';
import 'package:gym/core/widgets/myText.dart';
import '../../../../core/cubit/bank_cubit/cubit.dart';
import '../../../../core/cubit/bank_cubit/state.dart';
import '../../../../gen/assets.gen.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  late MainBloc cubit;
  int selected = 0;

  List<GoalDataStatic> listGoal = [
    GoalDataStatic(
      body: AppString.lean_tone_title,
      title: AppString.lean_tone,
      img: Assets.images.svg.lean,
    ),
    GoalDataStatic(
      body: AppString.lose_title,
      title: AppString.lose,
      img: Assets.images.svg.lose,
    ),
    GoalDataStatic(
      body: AppString.improve_title,
      title: AppString.improve,
      img: Assets.images.svg.shape,
    ),
  ];

  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.only(
              end: 15.0,
              start: 15.0,
              top: 15.0,
            ),
            child: myText(
              title: AppString.what_is_goal,
              style: Style.large,
              align: TextAlign.center,
            ),
          ),
          space10Vertical,
          const myText(
              title: AppString.i_will_help_us_to_choose_a_best_program,
              style: Style.medium,
              align: TextAlign.center),
          space10Vertical,
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              return Expanded(
                child: PageView.builder(
                  controller: PageController(
                    initialPage: selected,
                    viewportFraction: 0.7,
                    keepPage: true,
                  ),
                  allowImplicitScrolling: true,
                  pageSnapping: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () => setState(() {
                          selected = index;
                        }),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: buildDesign(
                              index: index,
                              model: listGoal[index]),
                        ));
                  },
                  itemCount: listGoal.length,
                ),
              );
            },
          ),
          space20Vertical,
          Padding(
            padding: const EdgeInsetsDirectional.only(
              end: 15.0,
              start: 15.0,
              top: 15.0,
            ),
            child: myElevatedButton(text: AppString.next, onPressed: () {}),
          ),

        ],
      );
  }

  Widget buildDesign({
    required GoalDataStatic model,
    required int index,
  }) =>
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              selected == index
                  ? BoxShadow(
                color: Theme.of(context).primaryColor,
                spreadRadius: 0,
                blurRadius: 25,
              ) : const BoxShadow(),
            ],
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                ColorManager.mainColor,
                ColorManager.secColor,
              ],
            )),
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    svgImage(path: model.img),
                    space20Vertical,
                    myText(
                      title: model.title,
                      style: Style.large,
                      color: Colors.white,
                    ),
                    space10Vertical,
                    myText(
                        title: model.body,
                        style: Style.small,
                        align: TextAlign.center,
                        color: Colors.white),
                  ],
                ),
              ),
            ],
        ),
      );
}

class GoalDataStatic extends Equatable {
  final String img;
  final String title;
  final String body;

  const GoalDataStatic(
      {required this.img, required this.title, required this.body});

  @override
  List<Object?> get props => [img, title, body];
}

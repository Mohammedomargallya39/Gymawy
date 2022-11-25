import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/utils/extension.dart';
import 'package:gym/core/widgets/myText.dart';
import 'package:gym/gen/assets.gen.dart';
import '../../../../core/cubit/bank_cubit/cubit.dart';
import '../../../../core/cubit/bank_cubit/state.dart';
import '../register_layout.dart';

class SelectTypePage extends StatefulWidget {
  const SelectTypePage({Key? key}) : super(key: key);

  @override
  State<SelectTypePage> createState() => _SelectTypePageState();
}

class _SelectTypePageState extends State<SelectTypePage> {
  late MainBloc cubit;

  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: AppString.register, context: context),
      body: Padding(
        padding: designApp,
        child: Center(
          child: BlocBuilder<MainBloc, MainState>(
            buildWhen: (previous, current) =>
                current is ChangeCoach || current is ChangeModeState,
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const myText(
                      title: AppString.select_type,
                      align: TextAlign.center,
                      fontWeight: FontWeight.w800,
                      style: Style.large),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                              onTap: () => cubit.selectType(isCoach: true).then(
                                  (value) => navigateTo(
                                      context, const RegisterLayout())),
                              child: buildCard(
                                  image: Assets.images.svg.coach,
                                  title: AppString.coach))),
                      space20Horizontal,
                      Expanded(
                          child: GestureDetector(
                              onTap: () => cubit
                                      .selectType(isCoach: false)
                                      .then((value) {
                                    cubit.changePage(0,context);
                                    navigateTo(context, const RegisterLayout());
                                  }),
                              child: buildCard(
                                  image: Assets.images.svg.client,
                                  title: AppString.clint))),
                    ],
                  ),
                  const Spacer(flex: 2),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildCard({required String title, required String image}) {
    return SizedBox(
      width: context.width * 0.40,
      height: context.heightScreenWithOutBottom * 0.35,
      child: Card(
        elevation: 7.0,
        shadowColor: Theme.of(context).primaryColor,
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            svgImage(path: image),
            myText(
              title: title,
              style: Style.large,
            ),
          ],
        ),
      ),
    );
  }
}

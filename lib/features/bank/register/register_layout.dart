import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/core/utils/extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/cubit/bank_cubit/cubit.dart';
import '../../../core/cubit/bank_cubit/state.dart';
import '../../../core/utils/appString.dart';
import '../../../core/utils/constants.dart';

class RegisterLayout extends StatefulWidget {
  const RegisterLayout({Key? key,
  }) : super(key: key);

  @override
  State<RegisterLayout> createState() => _RegisterLayoutState();
}

class _RegisterLayoutState extends State<RegisterLayout> {
  late MainBloc cubit;
  PageController pageController = PageController();

  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
              prevPage: cubit.currentIndex <= 0 ? false : true,
              cubit: cubit,
              title: AppString.create_account,
              context: context),
          body: Column(
            children: [
              Expanded(child: SizedBox(
                height: context.height *0.95,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return cubit.isCoach ? cubit.pagesCoach[index] : cubit.pagesClint[index];
                  },
                  controller: cubit.pageController,
                  itemCount: cubit.isCoach ? cubit.pagesCoach.length : cubit.pagesClint.length,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      cubit.currentIndex = index;
                    });
                  },
                ),
              )),
              SizedBox(
                height: context.height *0.05,
                child: Padding(
                  padding: designApp,
                  child: SmoothPageIndicator(
                    controller: cubit.pageController,
                    count: cubit.isCoach ? cubit.pagesCoach.length : cubit.pagesClint.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotWidth: 10,
                      spacing: 5,
                      expansionFactor: 5,
                      dotHeight: 10,
                      activeDotColor:Theme.of(context).primaryColor,
                    ),
                  ),),
              ),
            ],
          ),
        );
      },
    );
  }
}

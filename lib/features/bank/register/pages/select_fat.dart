import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/utils/extension.dart';
import 'package:gym/core/widgets/myElevatedButton.dart';
import 'package:gym/core/widgets/myText.dart';
import 'package:gym/gen/assets.gen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/cubit/bank_cubit/cubit.dart';

class SelectFat extends StatefulWidget {
  const SelectFat({Key? key}) : super(key: key);

  @override
  State<SelectFat> createState() => _SelectFatState();
}

class _SelectFatState extends State<SelectFat> {
  late MainBloc cubit;
  double fatValue = 0;
  late PageController pageController;

  List<String> listFat = [
    Assets.images.fat.fat1,
    Assets.images.fat.fat2,
    Assets.images.fat.fat3,
    Assets.images.fat.fat4,
    Assets.images.fat.fat5,
  ];

  Future<void> changePage(index) async {
    await pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease);
  }

  @override
  void initState() {
    cubit = context.read<MainBloc>();
    pageController = PageController(viewportFraction: 1/2,);
    super.initState();
  }

  myText getText(int val) {
    switch (val) {
      case 0:
        return myText(title:'3 - 7 ', style: Style.medium);
      case 1:
        return myText(title:'8 - 16', style: Style.medium);
      case 2:
        return myText(title:'17 - 24', style: Style.medium);
      case 3:
        return myText(title:'24 - 32', style: Style.medium);
      case 4:
        return myText(title:'32+', style: Style.medium);
      default:
        return myText(title:'', style: Style.medium);
    }
}


  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          space20Vertical,
          const myText(title:AppString.select_fat, style: Style.large),
          const myText(title:AppString.it_will_help, style: Style.small),
          space20Vertical,
          Expanded(
            flex: 3,
            child: SizedBox(
              height: context.heightScreenWithOutBottom * 0.55,
              child: PageView.builder(
                controller: pageController,
                allowImplicitScrolling: true,
                pageSnapping: true,
                
                itemBuilder: (context, index) {
                return  SizedBox(
                    width: 50,
                    height: 200,
                    child: svgImage(path: listFat[index],),
                  );
              },
                itemCount: listFat.length,
                onPageChanged: (index) {
                  setState(() {
                    fatValue = double.parse(index.toString());
                  });
                },
              ),
            ),
          ),
          space20Vertical,
          Expanded(flex: 2,
              child:Column(
              children: [
              Slider(
                value: fatValue,
                min: 0.0,
                max: 4.0,
                divisions: 4,
                label: fatValue.round().toString(),
                onChanged: (double value) async {
                  setState(() {
                    fatValue = value;
                  });
                  await pageController.animateToPage(
                      value.round(),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
              ),
              getText(fatValue.round()),
              Padding(
                padding: designApp,
                child: myElevatedButton(text: AppString.next,
                    onPressed: (){
                        int fat = (fatValue.round()) * 10 + 10;
                      cubit.nextPage(true,context);
                    }
                ),)
            ],
          )
          ),
        ],
      );
  }
}

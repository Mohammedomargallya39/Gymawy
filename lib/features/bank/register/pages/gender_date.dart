import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/core/cubit/bank_cubit/cubit.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/colors_manager.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/utils/extension.dart';
import 'package:gym/core/widgets/list_title_container.dart';
import 'package:gym/core/widgets/myElevatedButton.dart';
import 'package:gym/core/widgets/myText.dart';
import 'package:gym/core/widgets/myTextFill.dart';
import 'package:intl/intl.dart';
import '../../../../gen/assets.gen.dart';

class GenderDatePage extends StatefulWidget {
  const GenderDatePage({Key? key}) : super(key: key);

  @override
  State<GenderDatePage> createState() => _GendarDatePagheState();
}

class _GendarDatePagheState extends State<GenderDatePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var genderController = TextEditingController();
  var currencyController = TextEditingController();
  var pricePerMonth = TextEditingController();
  var dataOfBirth = TextEditingController();
  late MainBloc cubit;

  bool isMoneyEmpty = false;

  static const List<String> gender = [
    'Male',
    'Female',
  ];

  static const List<String> currency = [
    'EGP',
    // 'SAR',
    'USD',
    // 'EUR',
  ];

  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: designApp,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    svgImage(path: Assets.images.svg.couch),
                    space10Vertical,
                    myText(title: AppString.lets_complate, style: Style.large),
                    space10Vertical,
                    myText(title: AppString.will_help, style: Style.small),
                    space30Vertical,

                    myListTitle(
                      onClick: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext builder) {
                              return Container(
                                height: context.heightScreenWithOutBottom * 0.25,
                                color: Theme.of(context).scaffoldBackgroundColor,
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (value) {
                                    setState(() {
                                      dataOfBirth.text = DateFormat.yMMMd().format(value);
                                    });
                                  },
                                  initialDateTime: DateTime.now(),
                                  minimumYear: 2000,
                                  maximumYear: 3000,
                                ),
                              );
                            });
                      },
                      title: dataOfBirth.text.isEmpty ? AppString.date_of_brith : dataOfBirth.text,

                      svgImg: Assets.images.svg.date,
                    ),

                    space10Vertical,
                    Row(
                      children: [
                        Expanded(
                          child: myTextFill(
                            svgImg: Assets.images.svg.dollarSignSvgrepoCom,
                            controller: pricePerMonth,
                            hint: AppString.price_of_month,
                            type: TextInputType.number,
                            onChanged: (value) {
                              if (value!.isEmpty) {
                                setState(() {
                                  isMoneyEmpty = false;
                                });
                              } else {
                                setState(() {
                                  isMoneyEmpty = true;
                                });
                              }
                            },
                            validate: (String) {
                              if (String!.isEmpty) {
                                return 'isEmpty';
                              } else if (isInteger(int.parse(String))) {
                                return 'isInteger';
                              }
                            },
                          ),
                        ),
                        space10Horizontal,
                        Container(
                          width: context.width * 0.28,
                          height: context.heightScreenWithOutBottom * 0.07,
                          margin: EdgeInsets.only(bottom: 16),
                          child: CustomDropdown(
                            hintText: 'EGP',
                            fillColor: ColorManager.textFieldColor,
                            items: currency,
                            selectedStyle:
                                Theme.of(context).textTheme.displaySmall,
                            controller: currencyController,
                          ),
                        ),
                      ],
                    ),
                    CustomDropdown(
                      fillColor: ColorManager.textFieldColor,
                      hintText: AppString.choose_gender,
                      selectedStyle: Theme.of(context).textTheme.displaySmall,
                      items: gender,
                      controller: genderController,
                      excludeSelected: false,
                    ),
                    space20Vertical,
                    myElevatedButton(
                        text: AppString.next,
                        onPressed:
                            () {
                          cubit.nextPage(true,context);
                        }
                        ),
                  ]),
            ),
          ),
        ),
      );
  }

  bool isInteger(num value) => value is int || value == value.roundToDouble();

  bool isComplateData() {
    return isMoneyEmpty &&
        dataOfBirth.text.isEmpty &&
        genderController.text.isNotEmpty &&
        currencyController.text.isNotEmpty;
  }
}

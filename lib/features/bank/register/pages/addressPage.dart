import 'dart:convert';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/widgets/myElevatedButton.dart';
import '../../../../core/cubit/bank_cubit/cubit.dart';
import '../../../../core/utils/appString.dart';
import '../../../../core/widgets/loadingPage.dart';
import '../../../../gen/assets.gen.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  List<String> listCountry = [];
  List<String> listCity = [];
  var myData;
  late MainBloc cubit;
  bool changeCity = false;

  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJson(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingPage(),
          );
        } else {
          return StatefulBuilder(
            builder: (context, setState) => Padding(
              // Padding(
              padding: designApp,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    svgImage(path: Assets.images.svg.location),
                    CustomDropdown.search(
                      hintText: AppString.select_country,
                      items: listCountry,
                      controller: countryController,
                      onChanged: (value) {
                        setState(() {
                          changeCity = false;
                          getCities(value);
                        });
                      },
                    ),
                    space10Vertical,
                    if (listCity.isNotEmpty)
                      CustomDropdown.search(
                        hintText: AppString.select_city,
                        items: listCity,
                        controller: cityController,
                        onChanged: (value) {
                            setState(() {
                              changeCity = true;
                            });


                        },
                      ),
                    space10Vertical,
                    myElevatedButton(
                        text: AppString.next,
                        onPressed: changeCity ? () => cubit.nextPage(true, context) : null),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> readJson() async {
    var snapshot = await DefaultAssetBundle.of(context)
        .loadString('assets/json/new_json.json');
    myData = await json.decode(snapshot);
    myData.keys.forEach((key) {
      listCountry.add(key);
    });
  }

  Future<void> getCities(String txt) async {
    listCity.clear();
    await myData[txt].forEach((element) {
      listCity.add(element);
    });
    cityController.text = '';
  }
}

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/utils/extension.dart';
import 'package:gym/core/widgets/myButton.dart';
import 'package:gym/core/widgets/myTextFill.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/cubit/bank_cubit/cubit.dart';
import '../../../../core/cubit/bank_cubit/state.dart';
import '../../../../core/widgets/myElevatedButton.dart';
import '../../../../gen/assets.gen.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool isAccept = false;
  late MainBloc cubit;
  var formKey = GlobalKey<FormState>();
  File? imageFile;

  Future<File?> pickImageFromGallery(BuildContext context) async {
    File? image;
    try {
      final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    } catch (e) {
      showToast(
          message: 'e',
          toastStates: ToastType.failure,
          context: context);
    }
    return image;
  }

  void selectImage() async {
    imageFile = await pickImageFromGallery(context);
    setState(() {
    });
  }

  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: designApp,
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if (cubit.isCoach)
                    buildRichText(AppString.hey_coach),
                  Text(
                    AppString.create_your_account,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(),
                  ),
                  space20Vertical,
                  GestureDetector(
                      onTap: selectImage,
                      child: imageFile == null ?
                      svgImage(path: Assets.images.svg.group2584) :
                      CircleAvatar(
                        radius: context.heightScreenWithOutBottom * 0.15,
                        backgroundImage: FileImage(imageFile!),
                      )),

                  space20Vertical,
                  myTextFill(
                      svgImg: Assets.images.svg.user,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'isEmpty';
                        }
                      },
                      controller: cubit.userNameController,
                      hint: AppString.userName),
                  myTextFill(
                      svgImg: Assets.images.svg.user,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'isEmpty';
                        }
                      },
                      controller: cubit.fullNameController,
                      hint: AppString.fullName),
                  myTextFill(
                    svgImg: Assets.images.svg.email,
                    validate: (String? value) {
                      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                      if (value.isEmpty) {
                        return 'email is required';
                      } else if (!emailValid) {
                        return 'Incorrect email format';
                      }
                    },
                    controller: cubit.emailController,
                    hint: AppString.email,
                  ),
                  myTextFill(
                      svgImg: Assets.images.svg.phone,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'isEmpty';
                        }
                      },
                      controller: cubit.phoneController,
                      hint: AppString.phone),
                  myTextFill(
                      isPassword: true,
                      svgImg: Assets.images.svg.lock,
                      onChanged: (val) {
                        setState(() {
                          cubit.onPasswordChanged(val!);
                        },
                        );
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'isEmpty';
                        }
                      },
                      controller: cubit.passwordController,
                      hint: AppString.password),
                  myTextFill(
                    isPassword: true,
                      svgImg: Assets.images.svg.lock,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'isEmpty';
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          cubit.matchPassword();
                        },
                        );
                      },
                      controller: cubit.confirmPasswordController,
                      hint: AppString.confirm_password),
                  Visibility(
                    visible: cubit.passwordController.text.isNotEmpty && !cubit.isPasswordValid(),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10.0) //                 <--- border radius here
                            ),
                            color: Colors.blue[50],
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: validationRow(
                                    condition: cubit.isPasswordHasUpperAndLower,
                                    message: "Contains upper and lower case"),
                              ),
                              Container(
                                child: validationRow(
                                    condition: cubit.isPasswordHasSpecialCharacter,
                                    message: "Contains one special character"),
                              ),
                              Container(
                                child: validationRow(
                                    condition: cubit.isPasswordEightCharacters,
                                    message: "Contains at least 8 characters"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: cubit.isPasswordMach(),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10.0) //                 <--- border radius here
                            ),
                            color: Colors.blue[50],
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: validationRow(
                                    condition: cubit.isPasswordNotMach,
                                    message: "password does not match"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) {
                      setState(() {
                        isAccept = value!;
                      });
                    },
                    title: Text(
                      AppString.dont_have_account,
                      style: Theme
                          .of(context)
                          .textTheme
                          .displaySmall,),
                    value: isAccept,
                  ),
                  space10Vertical,
                  myElevatedButton(
                    text: AppString.next,
                    onPressed: isAccept ? (){
                      cubit.nextPage(true,context);
                    } : null,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  RichText buildRichText(String title) {
            return RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: title,
                          style: Theme.of(context).textTheme.displayMedium,
                          // recognizer: TapGestureRecognizer()..onTap = () {
                          //   // Single tapped.
                          // },
                        ),
                        // TextSpan(
                        //     text: title,
                        //     style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //     // recognizer:  DoubleTapGestureRecognizer()..onDoubleTap = () {
                        //     //   // Double tapped.
                        //     // }
                        // ),
                        // TextSpan(
                        //   text: ' Long press',
                        //   style: TextStyle(color: Colors.blue[300]),
                        //   // recognizer: LongPressGestureRecognizer()..onLongPress = () {
                        //   //   // Long Pressed.
                        //   // },
                        // ),
                      ],
                    ),
                  );
  }
  Widget validationRow({required bool condition, required String message}) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: condition ? Colors.green[300] : Colors.red[300],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              condition ? Icons.check : Icons.clear,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Text(message)
      ],
    ),
  );
}

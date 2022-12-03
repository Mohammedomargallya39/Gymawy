import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym/core/utils/colors_manager.dart';
import 'package:gym/core/utils/extension.dart';
import 'package:gym/core/widgets/myButton.dart';
import 'package:gym/features/bank/login/page/forget_password.dart';
import 'package:gym/features/bank/register/pages/pint_page.dart';
import 'package:gym/gen/assets.gen.dart';

import '../../../core/cubit/bank_cubit/cubit.dart';
import '../../../core/cubit/bank_cubit/state.dart';
import '../../../core/utils/appString.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/myTextFill.dart';
import '../register/pages/addressPage.dart';
import '../register/pages/select_type_page.dart';
import '../register/register_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late MainBloc cubit;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: designApp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    space30Vertical,
                    SvgPicture.asset(Assets.images.svg.icon),
                    space30Vertical,
                    Text(
                      AppString.welcome_gymawy,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontFamily: 'splash',
                            fontWeight: FontWeight.w400,
                            fontSize: 30.sp,
                          ),
                    ),
                    space30Vertical,
                    myTextFill(
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'isEmpty';
                        }
                      },
                      controller: emailController,
                      hint: AppString.email,
                      svgImg: Assets.images.svg.email,
                    ),
                    myTextFill(
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'isEmpty';
                        }
                      },
                      controller: passwordController,
                      hint: AppString.password,
                      isPassword: true,
                      svgImg: Assets.images.svg.lock,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            navigateTo(context, const ForgetPassword());
                          },
                          child: Text(AppString.forget_password,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ))),
                    ),
                    space20Vertical,
                    myButton(
                        elevation: 0.0,
                        textOnly: false,
                        iconWidget: svgImage(
                          path: Assets.images.svg.login,
                          color: Colors.white,
                        ),
                        height: context.heightScreenWithOutBottom * 0.09,
                        text: AppString.login,
                        onPressed: () {
                          // navigateTo(context, PinPage());
                        }),
                    space20Vertical,
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              style: const TextStyle(
                                  color: ColorManager.iconColor),
                              'ـ' * 50),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(AppString.oR)),
                          Text(
                              style: const TextStyle(
                                  color: ColorManager.iconColor),
                              'ـ' * 50),
                        ],
                      ),
                    ),
                    space20Vertical,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            // navigateTo(context, AddressPage());
                          },
                          child: svgImage(
                            path: Assets.images.svg.facebbokBorder,
                          ),
                        ),
                        space20Horizontal,
                        svgImage(
                          path: Assets.images.svg.google,
                        ),
                      ],
                    ),
                    space20Vertical,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppString.dont_have_account,
                            style: Theme.of(context).textTheme.displaySmall!),
                        // space10Horizontal,
                        TextButton(
                            onPressed: () {
                              cubit.changePage(0,context);
                              navigateTo(context, const SelectTypePage());
                            },
                            child: Text(AppString.signUp,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

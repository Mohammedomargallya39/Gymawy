import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym/core/cubit/bank_cubit/cubit.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/widgets/back_button.dart';
import 'package:gym/core/widgets/myElevatedButton.dart';
import 'package:gym/core/widgets/myText.dart';
import 'package:gym/core/widgets/myTextFill.dart';
import 'package:gym/features/bank/main_screen/profile_screen/profile_screen.dart';
import 'package:gym/gen/assets.gen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {


  late MainBloc cubit;

  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            children: [
              Row(
                children: [
                  DefaultBackButton(function: (){
                    Navigator.pop(context);
                  },),
                  space15Horizontal,
                  const myText(
                    title: AppString.editYourProfile,
                    style: Style.medium,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        myTextFill(
                          controller: usernameController,
                          hint: AppString.userName,
                          svgImg: Assets.images.svg.user,
                        ),
                        myTextFill(
                          controller: fullNameController,
                          hint: AppString.fullName,
                          svgImg: Assets.images.svg.user,
                        ),
                        myTextFill(
                          controller: emailController,
                          hint: AppString.email,
                          svgImg: Assets.images.svg.email,
                          type: TextInputType.emailAddress,
                        ),
                        myTextFill(
                          controller: phoneController,
                          hint: AppString.phone,
                          svgImg: Assets.images.svg.phone,
                          type: TextInputType.phone,
                        ),
                        myTextFill(
                          controller: passwordController,
                          hint: AppString.password,
                          svgImg: Assets.images.svg.lock,
                          type: TextInputType.visiblePassword,
                          isPassword: true,
                          suffixIcon: const Icon(Icons.visibility),
                        ),
                        myTextFill(
                          controller: confirmPasswordController,
                          hint: AppString.confirm_password,
                          svgImg: Assets.images.svg.lock,
                          type: TextInputType.visiblePassword,
                          isPassword: true,
                          suffixIcon: const Icon(Icons.visibility),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              myElevatedButton(text: AppString.finish, onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}

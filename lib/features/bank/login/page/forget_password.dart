import 'package:flutter/material.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/widgets/myButton.dart';
import 'package:gym/core/widgets/myElevatedButton.dart';
import 'package:gym/core/widgets/myText.dart';
import 'package:gym/core/widgets/myTextFill.dart';
import 'package:gym/features/bank/login/page/new_password.dart';

import '../../../../gen/assets.gen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var controller = TextEditingController();
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: AppString.forget_password, context: context),
      body: Padding(
        padding: designApp,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              svgImage(path: Assets.images.svg.forgetPass),
              space10Vertical,
              myText(
                title: AppString.enter_register,
                style: Style.large,
                align: TextAlign.center,
              ),
              space20Vertical,
              myTextFill(
                svgImg: Assets.images.svg.phone,
                  type: TextInputType.number,
                  controller: controller,
                  hint: AppString.phone,
                onChanged: (val) {
                    setState(() {
                    });
                },
              ),
              Spacer(),
              myElevatedButton(
                  text: AppString.send, onPressed: controller.text.isNotEmpty ? null : (){
                    navigateTo(context, NewPasswordPage());
              })
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/widgets/myElevatedButton.dart';
import 'package:gym/core/widgets/myText.dart';
import 'package:gym/core/widgets/myTextFill.dart';

import '../../../../gen/assets.gen.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isPasswordNotEmpty = false;
  bool isConfirmPasswordNotEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: AppString.new_password, context: context),
      body: Center(
        child: Padding(
          padding: designApp,
          child: Column(
            children: [
              space10Vertical,
              myText(
                title: AppString.new_password_title,
                style: Style.medium,
                align: TextAlign.center,
              ),
              space30Vertical,
              myTextFill(
                isPassword: true,
                svgImg: Assets.images.svg.lock,
                controller: passwordController,
                hint: AppString.password,
                onChanged: (val) {
                  if (val!.isNotEmpty) {
                    if (isPasswordNotEmpty != true) {
                      setState(() {
                        isPasswordNotEmpty = true;
                      });
                    }
                  } else {
                    setState(() {
                      isPasswordNotEmpty = false;
                    });
                  }
                },
              ),
              myTextFill(
                isPassword: true,
                svgImg: Assets.images.svg.lock,
                controller: confirmPasswordController,
                hint: AppString.confirm_password,
                onChanged: (val) {
                  if (val!.isNotEmpty) {
                    if (isPasswordNotEmpty != true) {
                      setState(() {
                        isPasswordNotEmpty = true;
                      });
                    }
                  } else {
                    setState(() {
                      isPasswordNotEmpty = false;
                    });
                  }
                },
              ),
              myElevatedButton(
                  text: AppString.save,
                  onPressed: isPasswordNotEmpty && isConfirmPasswordNotEmpty
                      ? () {}
                      : null)
            ],
          ),
        ),
      ),
    );
  }
}

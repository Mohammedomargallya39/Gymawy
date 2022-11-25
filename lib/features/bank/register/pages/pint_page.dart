import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/widgets/myElevatedButton.dart';
import 'package:gym/core/widgets/myText.dart';
import 'package:gym/gen/assets.gen.dart';

class PinPage extends StatefulWidget {
  const PinPage({Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  String pinCode= '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(
            title: AppString.verify, context: context),
        body: Padding(
          padding: designApp,
          child: Center(
            child: Column(
              children: [
                svgImage(path: Assets.images.svg.done),
                space30Vertical,
                const myText(
                  fontWeight: FontWeight.w900,
                  title: AppString.pin_code,
                  style: Style.large,
                  align: TextAlign.center,
                ),
                space30Vertical,
                OtpTextField(
                  numberOfFields: 6,
                  focusedBorderColor: Theme.of(context).primaryColor,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {

                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                    // showDialog(
                    //     context: context,
                    //     builder: (context){
                    //       return AlertDialog(
                    //         title: Text("Verification Code"),
                    //         content: Text('Code entered is $verificationCode'),
                    //       );
                    //     }
                    // );
                  }, // end onSubmit
                ),
                space30Vertical,
                const Spacer(),
                myElevatedButton(text: AppString.verify, onPressed: (){} ),
              ],
            ),
          ),
        ));
  }
}

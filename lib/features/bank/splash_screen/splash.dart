import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/utils/extension.dart';
import 'package:gym/core/widgets/myText.dart';
import 'package:gym/features/bank/login/login_app.dart';
import 'package:gym/gen/assets.gen.dart';
import '../../../core/cubit/bank_cubit/cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late MainBloc cubit;


  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2),() {
      navigateAndFinish(context, const LoginPage());
    });

  }


  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              SizedBox(
                height: context.height,
                child: SvgPicture.asset(
                  Assets.images.svg.background,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.images.svg.icon,
                      color: Colors.white,
                    ),
                    const myText(
                      title: AppString.gymAwy ,
                      style: Style.head_large,
                      fontFamily: 'splash',
                      color: Colors.white,
                    ),
                    space5Vertical,
                    const myText(
                      title: AppString.no_pain_no_gain ,
                      style: Style.medium,
                      fontFamily: 'splash',
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ],
                ),
              ),
            ],

          ),
        );
  }
}

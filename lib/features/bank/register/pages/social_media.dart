import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:gym/core/widgets/myElevatedButton.dart';
import 'package:gym/core/widgets/myTextFill.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/cubit/bank_cubit/cubit.dart';
import '../../../../gen/assets.gen.dart';

class SocialMediaPage extends StatefulWidget {
  const SocialMediaPage({Key? key}) : super(key: key);

  @override
  State<SocialMediaPage> createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  late MainBloc cubit;
  var facebookController = TextEditingController();
  var instagramController  = TextEditingController();
  var youtubeController  = TextEditingController();


  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
          padding: designApp,
          child: Column(
            children: [
              space20Vertical,
              Lottie.asset(Assets.images.lotti.social),
              space20Vertical,
              myTextFill(
                controller: facebookController,
                hint: AppString.facebook,
                svgImg: Assets.images.svg.facebook,),
              space10Vertical,

              myTextFill(
                controller: instagramController,
                hint: AppString.instagram,
                svgImg: Assets.images.svg.instagramSvgrepoCom,),
              space10Vertical,

              myTextFill(
                controller: youtubeController,
                hint: AppString.youTube,
                svgImg: Assets.images.svg.youtubeSvgrepoCom,),
              myElevatedButton(text: AppString.next, onPressed: (){
                // cubit.nextPage(true,context);
              }),
            ],
          ),
        ),
    );
  }
}

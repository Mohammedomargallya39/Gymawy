import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym/core/cubit/bank_cubit/cubit.dart';
import 'package:gym/core/utils/appString.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/widgets/back_button.dart';
import 'package:gym/core/widgets/myElevatedButton.dart';
import 'package:gym/core/widgets/myTextFill.dart';
import 'package:gym/features/bank/main_screen/profile_screen/profile_screen.dart';
import 'package:gym/gen/assets.gen.dart';

class EditLinksScreen extends StatefulWidget {
  const EditLinksScreen({Key? key}) : super(key: key);

  @override
  State<EditLinksScreen> createState() => _EditLinksScreenState();
}

class _EditLinksScreenState extends State<EditLinksScreen> {
  late MainBloc cubit;

  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController facebookLinkController = TextEditingController();
    TextEditingController instagramLinkController = TextEditingController();
    TextEditingController tiktokLinkController = TextEditingController();
    TextEditingController youtubeLinkController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: designApp,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: DefaultBackButton(function: () {
                        navigateTo(context, const ProfileScreen());
                      }),
                    ),
                    space15Horizontal,
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: SvgPicture.asset(
                        Assets.images.svg.social,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      myTextFill(
                        controller: facebookLinkController,
                        hint: AppString.facebookLink,
                        svgImg: Assets.images.svg.facebook,
                      ),
                      myTextFill(
                        controller: instagramLinkController,
                        hint: AppString.instagramLink,
                        svgImg: Assets.images.svg.instagramSvgrepoCom,
                      ),
                      myTextFill(
                        controller: tiktokLinkController,
                        hint: AppString.tiktokLink,
                        svgImg: Assets.images.svg.tiktok_black,
                      ),
                      myTextFill(
                        controller: youtubeLinkController,
                        hint: AppString.youtubeLink,
                        svgImg: Assets.images.svg.youtubeSvgrepoCom,
                      ),
                    ],
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

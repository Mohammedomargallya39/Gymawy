import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym/core/utils/colors_manager.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/gen/assets.gen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: Text('Settings',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.bold))),
      ),
      body: Column(
        children: [
          buildSettingsItem(
              'Notifications', Assets.images.svg.notifications_icon, context),
          buildSettingsItem(
              'Location', Assets.images.svg.location_icon, context),
          buildSettingsItem('Support', Assets.images.svg.support_icon, context),
          buildSettingsItem('Share', Assets.images.svg.share_icon, context),
          buildSettingsItem('Log Out', Assets.images.svg.logout_icon, context),
        ],
      ),
    );
  }

  Widget buildSettingsItem(
          String text, String iconPath, BuildContext context) =>
      InkWell(
        onTap: () {
          if (text == 'Notifications') {
          } else if (text == 'Location') {
          } else if (text == 'Support') {
          } else if (text == 'Share') {
          } else {}
        },
        child: Padding(
          padding: EdgeInsets.all(25.0.sp),
          child: Row(
            children: [
              SvgPicture.asset(iconPath),
              space20Horizontal,
              text == 'Log Out'
                  ? Text(text,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.red))
                  : Text(text,
                      style: Theme.of(context).textTheme.displayMedium!),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: ColorManager.mainColor,
              )
            ],
          ),
        ),
      );
}

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym/core/cubit/bank_cubit/cubit.dart';
import 'package:gym/core/utils/colors_manager.dart';

import '../../gen/assets.gen.dart';


// flutter packages pub run build_runner build

enum ToastType {
  success,
  failure,
  warning,
  help,
}

void showToast({
  required String message,
  required ToastType toastStates,
  required BuildContext context,
}) {
var snackBar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: toastStates.name,
    message: message,
    contentType: getContentType(toastStates),
  ),
);

ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

ContentType getContentType(ToastType toastStates) {
  switch (toastStates) {
    case ToastType.success:
      return ContentType.success;
    case ToastType.failure:
      return ContentType.failure;
    case ToastType.warning:
      return ContentType.warning;
    case ToastType.help:
      return ContentType.help;
}
}


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget,) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,),
          (route) {
        return false;
      },
    );

EdgeInsetsGeometry designApp = const EdgeInsets.all(25);

Widget svgImage({required String path,Color? color}){
  return color != null ?
  SvgPicture.asset(path ,color: color,height: 28,width: 28,) :
  SvgPicture.asset(path) ;
}

AppBar defaultAppBar({
      required String title,
      required BuildContext context,
      List<Widget>? actions,
      bool prevPage = false,
      MainBloc? cubit,
  }) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    actions: actions,
    elevation: 1.0,
    leading: IconButton(
      icon: svgImage(path: Assets.images.svg.arrowLeftSquare,
      color: ColorManager.iconColor),
      onPressed: (){
        prevPage ? cubit!.nextPage(false,context) : Navigator.pop(context);
      },
    ),
  );
}

enum Style {
  extraSmall,
  small,
  medium,
  large,
  head_large,
  head_medium,
}


var space3Vertical = SizedBox(
  height: 3.0.h,
);

var space4Vertical = SizedBox(
  height: 4.0.h,
);

var space5Vertical = SizedBox(
  height: 5.0.h,
);

var space8Vertical = SizedBox(
  height: 8.0.h,
);

var space10Vertical = SizedBox(
  height: 10.0.h,
);

var space15Vertical = SizedBox(
  height: 15.0.h,
);

var space20Vertical = SizedBox(
  height: 20.0.h,
);

var space30Vertical = SizedBox(
  height: 30.0.h,
);

var space40Vertical = SizedBox(
  height: 40.0.h,
);

var space50Vertical = SizedBox(
  height: 50.0.h,
);

var space60Vertical = SizedBox(
  height: 60.0.h,
);

var space70Vertical = SizedBox(
  height: 70.0.h,
);

var space80Vertical = SizedBox(
  height: 80.0.h,
);

var space90Vertical = SizedBox(
  height: 90.0.h,
);

var space100Vertical = SizedBox(
  height: 100.0.h,
);

var space3Horizontal = SizedBox(
  width: 3.0.w,
);

var space4Horizontal = SizedBox(
  width: 4.0.w,
);

var space5Horizontal = SizedBox(
  width: 5.0.w,
);

var space10Horizontal = SizedBox(
  width: 10.0.w,
);

var space15Horizontal = SizedBox(
  width: 15.0.w,
);

var space6Horizontal = SizedBox(
  width: 6.0.w,
);

var space20Horizontal = SizedBox(
  width: 20.0.w,
);

var space30Horizontal = SizedBox(
  width: 30.0.w,
);

var space40Horizontal = SizedBox(
  width: 40.0.w,
);

var space50Horizontal = SizedBox(
  width: 50.0.w,
);

var space60Horizontal = SizedBox(
  width: 60.0.w,
);

var space70Horizontal = SizedBox(
  width: 70.0.w,
);

var space80Horizontal = SizedBox(
  width: 80.0.w,
);

var space90Horizontal = SizedBox(
  width: 90.0.w,
);

var space100Horizontal = SizedBox(
  width: 100.0.w,
);

String? token = '';
double? currentLat = 0;
double? currentLng = 0;

void debugPrintFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
}
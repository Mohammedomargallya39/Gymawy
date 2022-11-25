import 'package:flutter/material.dart';
import 'package:gym/core/utils/extension.dart';
import '../../gen/assets.gen.dart';
import '../utils/colors_manager.dart';
import '../utils/constants.dart';
import 'myText.dart';

class myListTitle extends StatelessWidget {
  const myListTitle({Key? key,
  required this.title,
  this.svgImg,
  this.icon,
  this.onClick,
  this.onLongClick,
  this.styleText,

  }) : super(key: key);
  final String title;
  final Style? styleText;
  final String? svgImg;
  final IconData? icon;
  final VoidCallback? onClick;
  final VoidCallback? onLongClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.heightScreenWithOutBottom * 0.08,
      decoration: BoxDecoration(
        color: ColorManager.textFieldColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: onClick,
        onLongPress: onLongClick,
        leading: svgImg !=null ?
        svgImage(path: svgImg! ,
          color: ColorManager.iconColor,):
        Icon(icon),
        title: myText(
          title: title,
          style: styleText ?? Style.small,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/gen/assets.gen.dart';

class DefaultBackButton extends StatelessWidget {
   const DefaultBackButton({Key? key,required this.function}) : super(key: key);



  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:function,
      child: SvgPicture.asset(Assets.images.svg.arrow_back)
    );
  }
}

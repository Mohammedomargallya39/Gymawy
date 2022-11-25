import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym/core/utils/colors_manager.dart';

class myTextFill extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String hint;
  final bool disabled;
  final EdgeInsetsGeometry margin;
  final Widget? suffixIcon;
  final Color? colorPrefixIcon;
  final IconData? iconPrefix;
  final String? svgImg;
  final bool isPassword;
  final String? Function(String?)? validate;
  final Function(String?)? onChanged;
  final TextInputAction textInputAction;
  final TextInputType type;
  final ValueChanged<String>? onSubmit;



  const myTextFill({
    required this.controller,
    this.label,
    this.onChanged,
    this.svgImg,
    this.type = TextInputType.text,
    required this.hint,
    this.validate,
    this.disabled = false,
    this.margin = const EdgeInsets.only(bottom: 16),
    this.isPassword = false,
    this.suffixIcon,
    this.iconPrefix,
    this.onSubmit,
    this.colorPrefixIcon,
    this.textInputAction = TextInputAction.next,

  });

  @override
  State<myTextFill> createState() => _CustomInputState();
}

class _CustomInputState extends State<myTextFill> {
  bool isShown = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
        margin: widget.margin,
        decoration: BoxDecoration(
          color: ColorManager.textFieldColor,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(width: 1, color: ColorManager().darkColor),
        ),
        child: TextFormField (
          keyboardType: widget.type,
          textInputAction: widget.textInputAction,
          readOnly: widget.disabled,
          obscureText: widget.isPassword ? isShown : false,
          style: Theme.of(context).textTheme.displaySmall,
          maxLines: 1,
          onChanged: widget.onChanged,
          validator: widget.validate,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
              padding: const EdgeInsets.all(12.0),
              onPressed: () {
                setState(() {
                  isShown = !isShown;
                });
              },
              icon: isShown ? const Icon(Icons.visibility , color: ColorManager.iconColor) :  const Icon(
                  Icons.visibility_off , color: ColorManager.iconColor),) : widget.suffixIcon == null
                ? null
                : Padding(
              padding: const EdgeInsetsDirectional.all(12.0),
              child: widget.suffixIcon,
            ),
            // label: Text(
            //   widget.label,
            //   style: TextStyle(
            //     color: ColorManager().darkColor,
            //     fontSize: 14,
            //   ),
            // ),
            prefixIcon: widget.svgImg != null ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(widget.svgImg!,
                height: 24,
                width: 24,
                // fit: BoxFit.scaleDown,
              ),
            ) : Icon(
              widget.iconPrefix ,
              color: widget.colorPrefixIcon ??
                  ColorManager.iconColor
            ),

            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: ColorManager.darkColor.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
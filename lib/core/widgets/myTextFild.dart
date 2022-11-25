import 'package:flutter/material.dart';

import '../utils/colors_manager.dart';

class myTextField extends StatefulWidget {
  myTextField({Key? key,
    required this.controller,
    required this.text,
    this.validate,
    this.onChanged,
    this.iconPrefix,
    this.readOnly = false,
    this.enabled = true,
    this.isPassword = false,
    this.onSubmit,
    this.colorPrefixIcon,
    this.isBoarder = false,
    this.type = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.iconSuffix,


  }) : super(key: key);

  final TextEditingController controller;
  final Function(String val)? onChanged;
  final IconData? iconPrefix;
  final bool? readOnly;
  final bool? enabled;
  final Color? colorPrefixIcon;
  final ValueChanged<String>? onSubmit;
  final TextInputType type;
  final bool isPassword;
  final Widget? iconSuffix;
  final String text;
  final TextInputAction? textInputAction;
  final bool isBoarder;
  String? Function(String?)? validate;


  @override
  State<myTextField> createState() => _myTextFieldState();
}

class _myTextFieldState extends State<myTextField> {
  bool isShown = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: widget.onSubmit,
      controller: widget.controller,
      maxLines: 1,
      onChanged: widget.onChanged,
      keyboardType: widget.type,
      enabled: widget.enabled!,
      readOnly: widget.readOnly!,
      validator: widget.validate,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPassword ? isShown : false,
      decoration: InputDecoration(
        // labelText: widget.text,
        border: widget.isBoarder ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            // color: HexColor(redColor),
            width: 2,
          ),
        ) : null,
        prefixIcon: Icon(
            widget.iconPrefix ,
            color: widget.colorPrefixIcon ??
            ColorManager.mainColor
          ,),
        hintText: widget.text,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        suffixIcon: widget.isPassword
            ? IconButton(
          padding: const EdgeInsets.all(12.0),
          onPressed: () {
            setState(() {
              isShown = !isShown;
            });
          },
          icon: isShown ? const Icon(Icons.visibility) : const Icon(
              Icons.visibility_off),) : widget.iconSuffix == null
            ? null
            : Padding(
          padding: const EdgeInsetsDirectional.all(12.0),
          child: widget.iconSuffix,
        ),
      ),


    );
  }
}
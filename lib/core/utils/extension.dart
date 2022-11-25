import 'package:flutter/material.dart';


var appbarHeight = AppBar().preferredSize.height;

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get statusBar => MediaQuery.of(this).viewPadding.top;
  double get heightScreen => height - appbarHeight - statusBar - (width * 0.07);
  double get heightScreenWithOutBottom => height - appbarHeight - statusBar - (width * 0.14);
}
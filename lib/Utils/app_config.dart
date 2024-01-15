import 'package:flutter/cupertino.dart';


class AppConfig {
  BuildContext context;
  double height = 50;
  double width = 50;
  AppConfig(this.context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.of(context).size.width;
  }
}

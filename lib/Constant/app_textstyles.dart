
import 'package:flutter/cupertino.dart';

import 'app_color.dart';
import 'app_string.dart';

class AppTextStyles {
  static const boldTextStyle = TextStyle(
      fontSize: 25,
      color: AppColors.buttonColor,
      fontWeight: FontWeight.bold,
      fontFamily: AppString.textStylePoppins,
      shadows: [
        Shadow(
          color: AppColors.blackText,
          offset: Offset(1, 1), // Adjust the offset based on your desired shadow position
          blurRadius: 2, // Adjust the blur radius based on your desired shadow intensity
        ),
      ]

  );
  static const smallBoldTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: AppString.textStylePoppins,
      color: AppColors.white,
      shadows: [
        Shadow(
          color: AppColors.blackText,
          offset: Offset(2, 2), // Adjust the offset based on your desired shadow position
          blurRadius: 2, // Adjust the blur radius based on your desired shadow intensity
        ),
      ]
  );
  static const normalTextStyleGrey = TextStyle(
    fontSize: 15,
    color: AppColors.greyText,
    fontFamily: AppString.textStylePoppins,
  );
  static const saloonTextStyleGrey = TextStyle(
    fontSize: 15,
    color: AppColors.saloonGreyText,
    fontFamily: AppString.textStylePoppins,
  );
  static const smallTextStyleWhite = TextStyle(
      color: AppColors.white,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: AppString.textStylePoppins,
      shadows: [
        Shadow(
          color: AppColors.blackText,
          offset: Offset(1, 1), // Adjust the offset based on your desired shadow position
          blurRadius: 2, // Adjust the blur radius based on your desired shadow intensity
        ),
      ]
  );
  static const normalTextStyleBlack = TextStyle(
    fontSize: 15,
    color: AppColors.indicatorColor,
  );
  static const hintStyle = TextStyle(color: AppColors.greyText, fontSize: 12);
  static const normalTextStyleBlue = TextStyle(
      color: AppColors.blue,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: AppString.textStylePoppins,
      shadows: [
        Shadow(
          color: AppColors.white,
          offset: Offset(1, 1), // Adjust the offset based on your desired shadow position
          blurRadius: 1, // Adjust the blur radius based on your desired shadow intensity
        ),
      ]



  );
  static const normalTextStyleWhite = TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: AppString.textStylePoppins,
      shadows: [
        Shadow(
          color: AppColors.blackText,
          offset: Offset(1, 1), // Adjust the offset based on your desired shadow position
          blurRadius: 2, // Adjust the blur radius based on your desired shadow intensity
        ),
      ]

  );
  static const regularTextStyleBlue = TextStyle(
      color: AppColors.blue, fontSize: 20, fontWeight: FontWeight.bold);
  static const regularTextStyleBlack = TextStyle(
      color: AppColors.blackText,
      fontSize: 20,
      fontWeight: FontWeight.w900,
      fontFamily: AppString.textStylePoppins);
  static const saloonTextStyleBlack = TextStyle(
      color: AppColors.blackText,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      fontFamily: AppString.textStylePoppins);
  static const userHomeScreen = TextStyle(
      color: AppColors.blackText,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      fontFamily: AppString.textStylePoppins);
  static const userHomeScreenGrey = TextStyle(
      color: AppColors.greyText,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      fontFamily: AppString.textStylePoppins);
  static const servicesText = TextStyle(
      color: AppColors.servicesText,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      fontFamily: AppString.textStylePoppins);

  static const smallTextStyleBlack =
      TextStyle(fontSize: 15, fontFamily: AppString.textStylePoppins);
}

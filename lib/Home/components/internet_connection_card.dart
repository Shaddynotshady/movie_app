import 'package:flutter/cupertino.dart';

import '../../Constant/app_images.dart';
import '../../Constant/app_textstyles.dart';

class InternetConnection{
  static interNetConnection(){
    return Column(
      children: [
        Image.asset(AppImage.isInternetConnected,height: 400,fit: BoxFit.contain,),
        const Text('Check your Internet Connection',style: AppTextStyles.saloonTextStyleBlack,),
      ],
    );
  }
}
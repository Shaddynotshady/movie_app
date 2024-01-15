import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Home/View/bottom_bar.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(()=>BottomBarScreen());

    });
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:  CircularProgressIndicator(),
      ),
    );
  }
}

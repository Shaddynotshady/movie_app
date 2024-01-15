import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CheckConnectivity {
  static checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(msg: 'Internet is not Connected');
      return false;
    }
    return true;
  }
}
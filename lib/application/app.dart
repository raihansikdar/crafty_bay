import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crafty_bay/application/state_holders_binders.dart';
import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay/presentation/ui/utility/custom_size_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
   CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {

  late final StreamSubscription _connectivityStatusStream;
  void checkInitialInternetConnection()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    handleConnectivityStates(connectivityResult);
  }
   void checkInternetConnectivityStatus(){
     _connectivityStatusStream = Connectivity().onConnectivityChanged.listen((status) {
       handleConnectivityStates(status);
     });
   }
   void handleConnectivityStates(ConnectivityResult status){
     if(status != ConnectivityResult.wifi && status != ConnectivityResult.mobile){
       Get.showSnackbar(const GetSnackBar(
         title: 'No internet!',
         message: 'Please check your internet connectivity',
         isDismissible: false,
       ));
       // Get.defaultDialog(
       //   title: "Alert",
       //   middleText: "No internet connection",
       //   textConfirm: "Try Again",
       //   textCancel: "Cancel",
       //   confirmTextColor: Colors.white,
       //   buttonColor: Colors.blue,
       //   onConfirm: () => checkInternetConnectivityStatus(),
       //   onCancel: () => Get.back(),
       // );
     }else{
       //print("object");
       if (Get.isSnackbarOpen) {
         Get.closeAllSnackbars();
       }
     }
   }

   @override
  void initState() {
     checkInitialInternetConnection();
     checkInternetConnectivityStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Get the screen size
    Size size = MediaQuery.of(context).size;
    // Set the screen width and height in the ScreenSizes utility class
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CraftyBay',
      navigatorKey: CraftyBay.globalKey,
      initialBinding: StateHolderBinder(),
      theme: ThemeData(
        primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors().color),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding:  EdgeInsets.symmetric(vertical: 12.rh),
            textStyle: const TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.rh),
            ),
          ),
        ),
        inputDecorationTheme:  InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.rh),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),

      home: const SplashScreen(),
    );
  }

  @override
  void dispose() {
    _connectivityStatusStream.cancel();
    super.dispose();
  }
}


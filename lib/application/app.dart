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
}


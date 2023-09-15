import 'dart:async';

import 'package:crafty_bay/presentation/state_holders/timer_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
 // final timer = Get.put(TimerController());
  int timeLeft = 120;
  bool remainTime = true;
  void _startCountDown(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(timeLeft > 0){
        timeLeft--;
        setState(() {});
      }else{
      remainTime = false;
        timer.cancel();
      }
    });
  }
  @override
  void initState() {
    _startCountDown();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 80,),
                Center(
                  child: SvgPicture.asset(
                    AssetsPath.craftybayLogoSVG,
                    width: 100,
                  ),
                ),
                Text("Enter your OTP code",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 24.0,
                ),),
                const SizedBox(height: 4.0,),
                Text("A 4 digit OTP code has been sent",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                ),),
                const SizedBox(height: 16.0,),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: AppColors.primaryColor,
                    selectedColor: Colors.green
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {

                  },
                  beforeTextPaste: (text) {
                    return true;
                  }, appContext: context,
                ),

                const SizedBox(height: 16.0,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>const CompleteVerificationScreen());
                    },
                    child: const Text("Next"),
                  ),
                ),
                const SizedBox(height: 24.0,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   RichText(
                     text:  TextSpan(
                         style: const TextStyle(color: Colors.grey),
                         children: [
                           const TextSpan(text: 'This code will expire in '),
                           TextSpan(
                             text: timeLeft.toString(),
                             style: const TextStyle(
                               color: AppColors.primaryColor,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ]
                     ),
                   ),
                   RichText(text:   const TextSpan(
                     text: "s",
                     style: TextStyle(
                       color: AppColors.primaryColor,
                       fontWeight: FontWeight.bold,
                     ),
                   ),)
                 ],
               ),
               // Obx(() =>  RichText(
               //   text:  TextSpan(
               //       style: const TextStyle(color: Colors.grey),
               //       children: [
               //         const TextSpan(text: 'This code will expire in '),
               //         TextSpan(
               //           text: timer.time.value,
               //           style: const TextStyle(
               //             color: AppColors.primaryColor,
               //             fontWeight: FontWeight.bold,
               //           ),
               //         ),
               //       ]
               //   ),
               // ),),
               OutlinedButton(
                 style: TextButton.styleFrom(foregroundColor: Colors.grey,),
                  onPressed: timeLeft != 0 ? null : () {
                    debugPrint("press");
                  },
                  child: const Text('Resend'),
                )
              ],
            ),
          )
      ),
    );
  }
}

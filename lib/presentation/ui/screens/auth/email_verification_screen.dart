import 'package:crafty_bay/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

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
                Text("Welcome back",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 24.0,
                ),),
                const SizedBox(height: 4.0,),
                Text("Please enter your email address",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                ),),
                const SizedBox(height: 16.0,),
                TextFormField(
                  decoration: const InputDecoration(
                  hintText: "Email Address",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 16.0,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(()=>const OTPVerificationScreen());
                },
                child: const Text("Next"),
              ),
            ),
          ],
            ),
          )
      ),
    );
  }
}

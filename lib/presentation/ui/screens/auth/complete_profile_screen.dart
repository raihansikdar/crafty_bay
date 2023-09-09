import 'package:crafty_bay/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompleteVerificationScreen extends StatelessWidget {
  const CompleteVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 24.0,),
                  Center(
                    child: SvgPicture.asset(
                      AssetsPath.craftybayLogoSVG,
                      width: 100,
                    ),
                  ),
                  Text("Complete Profile",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24.0,
                  ),),
                  const SizedBox(height: 4.0,),
                  Text("Get started with us by share your details",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                  ),),
                  const SizedBox(height: 16.0,),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "First Name",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Last Name",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Mobile",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "City",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    maxLines: 6,
                    decoration: const InputDecoration(
                      hintText: "Shipping address",
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0,
                      )
                    ),
                  ),
                  const SizedBox(height: 16.0,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: const Text("Next"),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}

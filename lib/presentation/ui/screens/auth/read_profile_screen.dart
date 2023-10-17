import 'package:crafty_bay/presentation/state_holders/auth_controller/read_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadProfileScreen extends StatefulWidget {
  const ReadProfileScreen({Key? key}) : super(key: key);

  @override
  State<ReadProfileScreen> createState() => _ReadProfileScreenState();
}

class _ReadProfileScreenState extends State<ReadProfileScreen> {
  @override
  void initState() {
    Get.find<ReadProfileController>().getUserProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 16),
        child: SizedBox(
          height: 180,
          width: double.infinity,
          child: GetBuilder<ReadProfileController>(
            builder: (_readProfileController) {
              return _readProfileController.isReadProfileInProgress ? const Center(child: CircularProgressIndicator()) : Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("First Name : ${_readProfileController.profileModel.data?.first.firstName ?? ''}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor
                      ),
                      ),
                      SizedBox(height: 8,),
                      Text("Last Name : ${_readProfileController.profileModel.data?.first.lastName ?? ''}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text("Phone Number : ${_readProfileController.profileModel.data?.first.mobile ?? ''}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text("City : ${_readProfileController.profileModel.data?.first.city ?? ''}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text("Email : ${_readProfileController.profileModel.data?.first.email ?? ''}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}

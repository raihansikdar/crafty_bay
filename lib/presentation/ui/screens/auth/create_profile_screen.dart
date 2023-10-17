import 'package:crafty_bay/presentation/state_holders/auth_controller/create_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller/read_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/read_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _shippingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controller = Get.find<ReadProfileController>();
  @override
  void initState() {
    controller.getUserProfile();
    _firstNameController.text = controller.profileModel.data?.first.firstName ?? '';
    _lastNameController.text = controller.profileModel.data?.first.lastName ?? '';
    _mobileController.text = controller.profileModel.data?.first.mobile ?? '';
    _cityController.text = controller.profileModel.data?.first.city ?? '';
    _shippingController.text = controller.profileModel.data?.first.shippingAddress ?? '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
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
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        hintText: "First Name",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                          return "Enter your first name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        hintText: "Last Name",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                          return "Enter your last name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _mobileController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Mobile",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                          return "Enter your mobile";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        hintText: "City",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                          return "Enter your city";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _shippingController,
                      maxLines: 6,
                      decoration: const InputDecoration(
                        hintText: "Shipping address",
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 16.0,
                        )
                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                          return "Enter your shipping address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0,),
                    GetBuilder<CreateProfileController>(
                      builder: (_createProfileController) {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                             if(_formKey.currentState!.validate()){
                               final response = await _createProfileController
                                   .createUserProfile(
                                   firstName: _firstNameController.text.trim(),
                                   lastName: _lastNameController.text.trim(),
                                   mobile: _mobileController.text.trim(),
                                   city: _cityController.text.trim(),
                                   shippingAddress: _shippingController.text.trim(),
                               );
                               if(response == true){
                                 _firstNameController.clear();
                                 _lastNameController.clear();
                                 _cityController.clear();
                                 _mobileController.clear();
                                 _shippingController.clear();
                                 Get.to(()=> ReadProfileScreen());
                               } else{
                                 if(mounted){
                                   ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                       content: Text(
                                         _createProfileController.errorMessage,
                                       ),
                                     ),
                                   );
                                 }
                               }

                             }
                            },
                            child: _createProfileController.isCreateProfileInProgress ?
                            Center(
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 4,
                                        )),
                                  ),
                                  SizedBox(width: 30,),
                                  Text("Please wait",style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                ],),
                            )
                                : const Text("Next"),
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}

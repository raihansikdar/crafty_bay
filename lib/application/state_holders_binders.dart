import 'package:crafty_bay/presentation/state_holders/auth_controller/email_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/carousel_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(CarouselSliderController());
    Get.put(CategoryController());
  }
}
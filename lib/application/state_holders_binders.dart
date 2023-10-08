import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller/email_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/carousel_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_controller/new_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_controller/popular_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_controller/special_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controlller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(CarouselSliderController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
  }
}
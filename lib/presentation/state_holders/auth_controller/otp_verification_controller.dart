import 'dart:developer';

import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/services/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller/auth_utility_controller.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController{

    bool _otpInProgress = false;
    String _message = '';

    bool get otpInProgress => _otpInProgress;
    String get message => _message;

    Future<bool> verifyOtp({required String email,required String otp}) async {
      _otpInProgress = true;
      update();

      NetworkResponse response = await NetworkCaller.getRequest(Urls.verifyOtp(email: email, otp: otp));

      log("otpControllerGetRequest statusCode ==> ${response.statusCode}");
      log("otpControllerGetRequest body ==> ${response.body}");

      _otpInProgress = false;
      update();
      if(response.isSuccess){
        _message = response.body['data'];
        await AuthUtilityController.setAccessToken(token: response.body['data']);
        return true;
      }else{
        return false;
      }
    }
}
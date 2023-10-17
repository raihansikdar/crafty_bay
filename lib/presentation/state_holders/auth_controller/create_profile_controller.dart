import 'package:crafty_bay/data/models/product_review_model.dart';
import 'package:crafty_bay/data/models/read_profile_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/services/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateProfileController extends GetxController{
  bool _isCreateProfileInProgress = false;
  String _errorMessage = '';

  bool get isCreateProfileInProgress => _isCreateProfileInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> createUserProfile({required String firstName,required String lastName,required String mobile,required String city,required String shippingAddress})async{
    _isCreateProfileInProgress = true;
    update();
    Map<String,dynamic> requestBody = {
      "firstName":firstName,
      "lastName":lastName,
      "mobile":mobile,
      "city":city,
      "shippingAddress":shippingAddress
    };
    NetworkResponse response = await NetworkCaller.postRequest(Urls.createUserProfile, requestBody);
    _isCreateProfileInProgress = false;

    if(response.isSuccess){
      update();
      return true;
    }else{
      _errorMessage = "Create profile failed";
      update();
      return false;
    }
  }
}
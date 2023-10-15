import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/services/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class DeleteCartListProductController extends GetxController{
  String _message = "";
  String get message => _message;

  Future<bool> deleteCartProduct({required int productId}) async{
     NetworkResponse response = await NetworkCaller.getRequest(Urls.deleteCartListProduct(productId: productId));
     if(response.isSuccess){
       return true;
     }else{
       _message = "Delete cart list product has been failed";
       return false;
     }
  }
}
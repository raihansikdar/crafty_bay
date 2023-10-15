import 'package:crafty_bay/data/models/wish_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/services/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class WishListController extends GetxController{
  bool _isWishListInProgress = false;
  WishListModel _wishListModel = WishListModel();
  String _message = "";

  bool get isWishListInProgress => _isWishListInProgress;
  WishListModel get wishListModel => _wishListModel;
  String get message => _message;

  Future<bool> getWishListProduct() async{
     _isWishListInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getWishList);
    _isWishListInProgress = false;

    if(response.isSuccess){
      _wishListModel = WishListModel.fromJson(response.body);
      update();
      return true;
    }else{
      _message = "WishList product fetch failed! Try again";
      update();
      return false;
    }
  }
}
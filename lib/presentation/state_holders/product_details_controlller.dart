import 'package:crafty_bay/data/models/product_details/product_details_data.dart';
import 'package:crafty_bay/data/models/product_details/product_details_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/services/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  bool _isProductDetailsInProgress = false;
  ProductDetailsData _productDetailsData = ProductDetailsData();
  String _errorMessage = '';

  bool  get isProductDetailsInProgress => _isProductDetailsInProgress;
  ProductDetailsData get productDetailsData => _productDetailsData;
  String get errorMessage => _errorMessage;

  Future<bool>getProductDetails({required int productId})async{
    _isProductDetailsInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductDetails(productId: productId));

    _isProductDetailsInProgress = false;
    if(response.isSuccess){
      _productDetailsData = ProductDetailsModel.fromJson(response.body).data!.first;
      update();
      return true;
    }else{
      _errorMessage = 'fetch product details failed';
      update();
      return false;
    }
  }
}
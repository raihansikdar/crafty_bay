import 'package:crafty_bay/data/models/home/popular/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/services/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  ProductModel _popularProductModel = ProductModel();
  bool _isPopularInProgress = false;
  String _errorMessage ='';

  ProductModel get popularProductModel => _popularProductModel;
  bool get isPopularInProgress => _isPopularInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> getPopularProduct()async{
    _isPopularInProgress = true;
    update();

    NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductByRemark(remark: 'popular'));

    _isPopularInProgress = false;
    if(response.isSuccess){
      _popularProductModel = ProductModel.fromJson(response.body);
      update();
      return true;
    }else{
      _errorMessage = 'Fetch popular product failed';
      update();
      return false;
    }
  }
}
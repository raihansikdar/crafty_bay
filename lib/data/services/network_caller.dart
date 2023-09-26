import 'dart:convert';
import 'dart:developer';

import 'package:crafty_bay/data/services/network_response.dart';
import 'package:http/http.dart';

class NetworkCaller{
  ///----------------------------------->> get request method <<----------------------------------
  Future<NetworkResponse> getRequest(String url) async{
   try{
     Response response = await get(Uri.parse(url)); //headers: {'Content-Type': 'application/json','token':AuthUtility.userInfo.token.toString()

     log("getRequest statusCode ==> ${response.statusCode}");
     log("getRequest body ==> ${response.body}");

     if(response.statusCode == 200 && jsonDecode(response.body)['msg'] == 'success'){
       return NetworkResponse(isSuccess: true, statusCode: response.statusCode, responseJsonBody: response.body);
     }else if(response.statusCode == 401){
       gotoLogin();
     }else{
       return NetworkResponse(isSuccess: false, statusCode: response.statusCode, responseJsonBody: null);
     }

   }catch(e){
     log(e.toString());
   }
   return NetworkResponse(isSuccess: false, statusCode: -1, responseJsonBody: null);
  }

  ///----------------------------------->> post request method <<----------------------------------

  Future<NetworkResponse> postRequest(String url,Map<String,dynamic>body,{bool isLogin = false}) async{
    try{
      Response response = await post(Uri.parse(url),headers: {'Content-Type': 'application/json',}, body: jsonEncode(body)); // 'token': AuthUtility.userInfo.token.toString()

      log("postRequest statusCode ==> ${response.statusCode}");
      log("postRequest body ==> ${response.body}");

      if(response.statusCode == 200 && jsonDecode(response.body)['msg'] == 'success'){
        return NetworkResponse(isSuccess: true, statusCode: response.statusCode, responseJsonBody: response.body);
      }else if(response.statusCode == 401){
        if (isLogin == false) {
          gotoLogin();
        }
      }else{
        return NetworkResponse(isSuccess: false, statusCode: response.statusCode, responseJsonBody: null);
      }
    }catch(e){
      log(e.toString());
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, responseJsonBody: null);
  }

  Future<void> gotoLogin() async {
    // await AuthUtility.clearUserInfo();
    // Navigator.pushAndRemoveUntil(
    //     TaskManagerApp.globalKey.currentContext!,
    //     MaterialPageRoute(builder: (context) => LoginScreen()),
    //         (route) => false);
  }
}
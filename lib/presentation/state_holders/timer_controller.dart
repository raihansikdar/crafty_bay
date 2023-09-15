import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController{

  Timer? _timer;
  int remainingSeconds =1;
  final time = '120'.obs;

  @override
  void onReady(){
    _startTimer(120);
    super.onReady();
  }

  @override
  void onClose(){
    if(_timer!=null){
      _timer!.cancel();
    }
    super.onClose();
  }

  _startTimer(int seconds){
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if(remainingSeconds==0){
        timer.cancel();
      }else{
       // int minutes = remainingSeconds~/60;
        int seconds = (remainingSeconds%60);
        //time.value = minutes.toString().padLeft(2, "0")+ ":"+seconds.toString().padLeft(2, "0");
        time.value = seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });
  }
}
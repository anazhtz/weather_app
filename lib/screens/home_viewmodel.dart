import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/helper/getx_helper.dart';
import 'package:weather_app/helper/global_var.dart';
import 'package:weather_app/screens/weather_model.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends GetxController{
  Rx<WeatherModel> weatherModel = WeatherModel().obs;
  RxString location = 'Malappuram, India'.obs;
  @override
  void onReady() {
  getLastLocationAndUpdate();
    super.onReady();
  }
  getLastLocationAndUpdate(){
    location.value = GetStorage().read('lastLocation') ?? 'Malappuram, Pakistan';

    var data = GetStorage().read(location.value)?? <String,dynamic>{};
    weatherModel.value = WeatherModel.fromJson(data);
  }

  getWeatherUpdate() async {
    try{
      Map<String,String>header = {
        'Content-Type':'application/json'
      };
      String url = 'https://api.openweathermap.org/data/2.5/weather';
      Map<String,String> params ={
        'appid' : '89a3a65f7b87548f576050a3f381f50c',
        'q':location.value,
        'units':',etric'
      };
      Uri uriValue = Uri.parse(url).replace(queryParameters: params);
      GlobalVariable.showLoader.value= true;
      http.Response response = await http.get(uriValue,headers: header);
      Map<String,dynamic> parsedJson = jsonDecode(response.body);
      GlobalVariable.showLoader.value= false;

      if(parsedJson['code']==200){
        weatherModel.value = WeatherModel.fromJson(parsedJson);
        GetStorage().write(location.value, parsedJson);
        GetXHelper.showSnackbar(message: 'Weather updated successfully');
      }else{
        GetXHelper.showSnackbar(message: 'Something Went Wrong');
      }

    }catch(e){
      GetXHelper.showSnackbar(message: e.toString());
    }
  }

}
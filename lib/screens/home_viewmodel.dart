import 'package:get/get.dart';
import 'package:weather_app/helper/global_var.dart';
import 'package:weather_app/screens/weather_model.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends GetxController{
  Rx<WeatherModel> weatherModel = WeatherModel().obs;
  RxString location = 'Malappuram, India'.obs;
  @override
  void onReady() {

    super.onReady();
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
      GlobalVariable.showLoader.value= false;

    }catch(e){

    }
  }

}
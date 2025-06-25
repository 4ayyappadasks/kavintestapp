import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:kavinapp/model/homescreen/recipes_model.dart';

class Homecontroller extends GetxController {
  final dio = Dio();


  Recipes? recipes;

  RxBool apiloading = false.obs;
  RxBool apierror = false.obs;

  Apicall() async {
    try {
      apiloading.value= true;
      apierror.value= false;
      var response = await dio.get("https://dummyjson.com/recipes");
      log("reponse : ${response.data}");
      if (response.statusCode == 200) {
        recipes = Recipes.fromJson(response.data);
        apiloading.value= false;
        apierror.value= false;
      } else {
        log("error in api call with status code: ${response.statusCode}");
        apiloading.value= false;
        apierror.value= true;
      }
    } catch (e) {
      log("error in api call :$e");
      apiloading.value= false;
      apierror.value= true;
    }
  }
  @override
  void onInit() {
    Apicall();
    // TODO: implement onInit
    super.onInit();
  }
}

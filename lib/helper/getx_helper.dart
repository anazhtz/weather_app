import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXHelper{
  static showSnackbar({required String message}){
    Get.showSnackbar(
     GetSnackBar(
       duration: Duration(seconds: 3),
       backgroundColor: Colors.white,
       message: message,
       messageText: Text(message,style: TextStyle(color: Colors.black),),

     )
    );
  }
}
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class GlobalController extends GetxController { 
  String _token=''; 
  String get token => _token;
  void showDialog(dynamic title, String message) {
    showCupertinoModalPopup(
      context: Get.overlayContext!,
      builder: (_) => CupertinoActionSheet(
        title: Text(title.toString()),
        message: Text(message),
        cancelButton: CupertinoActionSheetAction(
          child: Text('ACEPTAR'),
          onPressed: () => Get.back(),
        ),
      ),
    );
  } 

  // Esto para el manejo de token es TEMPORAL 
  set token(String token){
    this._token = token; 
  }

}

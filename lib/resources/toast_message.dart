

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterT {

  void toastMessage(String message){
    Fluttertoast.showToast(
        msg:message,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}
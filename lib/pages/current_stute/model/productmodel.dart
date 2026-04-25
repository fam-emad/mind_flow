import 'dart:core';

import 'package:flutter/material.dart';

class ProductModel {

  final String name;
  final IconData icon;
  final Color color;
    String ?startDt;
    String? endDt;
    // Duration? diff;
      int? minutes;
 

  ProductModel(    {
    
   required this.name, 
      required this.icon, 
         required this.color, 
            required this.startDt, 
               required this.endDt, 
            //  required this.diff,
            required this.minutes,
   
});

}
// import 'package:flutter/material.dart';
// import 'package:study_lamp/pages/current_stute/model/iconstate.dart';
// import 'package:study_lamp/pages/current_stute/widget/CustomBox.dart';
// import 'package:study_lamp/pages/current_stute/model/productmodel.dart'; 

// // =========================
// // 1) DATA SOURCE
// // =========================

// List<ProductModel> fakeProducts = [
//   ProductModel(
//     name: "focus",
//     icon: geticon("focus"),
//     color: getColor("focus"),
//     startDt: "12:00",
//     endDt: "12:10",
//     minutes: 10,
//   ),
//   ProductModel(
//     name: "tired",
//     icon: geticon("tired"),
//     color: getColor("tired"),
//     startDt: "12:10",
//     endDt: "12:20",
//     minutes: 10,
//   ),
//   ProductModel(
//     name: "stressed",
//     icon: geticon("stressed"),
//     color: getColor("stressed"),
//     startDt: "12:20",
//     endDt: "12:30",
//     minutes: 10,
//   ),
// ];

// // =========================
// // 2) READY UI LIST (CustomBox)
// // =========================

// List<Widget> buildCustomBoxList() {
//   return fakeProducts.map((item) {
//     return CustomBox(
//       height: 90,
//       width: 342,
//       radius: 32,
//       text: item.name,
//       fontSize: 19,
//       iscolor: true,
//       icon: item.icon,
//       iconcolor: item.color,
//       text2: "${item.startDt} → ${item.endDt}",
//       mintxt: "${item.minutes}",
//       onTap: () {},
//     );
//   }).toList();
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:study_lamp/core/network/socket_service.dart';
import 'package:study_lamp/pages/current_stute/model/iconstate.dart';
import 'package:study_lamp/pages/current_stute/model/productmodel.dart';
import 'package:study_lamp/pages/current_stute/widget/CustomBox.dart';
import 'package:study_lamp/pages/home/views/appdata.dart';

List<Widget> buildCustomBoxList(List<ProductModel> products) {
  return products.map((item) {
    return CustomBox(
      height: 90,
      width: 342,
      radius: 32,
      text: item.name,
      fontSize: 19,
      iscolor: true,
      icon: item.icon,
      iconcolor: item.color,
      text2: item.endDt == null
          ? "${item.startDt} → Now"
          : "${item.startDt} → ${item.endDt}",
      mintxt: "${item.minutes}",
      onTap: () {},
    );
  }).toList();
}
 



//  class DataController {
//   static List<ProductModel> products = AppData2.products2;

//   static StreamSubscription? _sub;
//   static String? lastState;

//   static void start() {
//     _sub = WebSocketService().stream.listen((data) {
//       final now = DateTime.now();
//       final time = DateFormat('HH:mm:ss').format(now);

//       _handleState(data.toString(), time);
//     });
//   }

//   static void stop() {
//     _sub?.cancel();
//   }

//   static void _handleState(String state, String time) {
//     if (products.isNotEmpty) {
//       products.last.endDt = time;
//     }

//     if (lastState == state) return;

//     products.add(
//       ProductModel(
//         name: state,
//         icon: geticon(state),
//         color: getColor(state),
//         startDt: time,
//         endDt: null,
//         minutes: 0,
//       ),
//     );

//     lastState = state;
//   }
// }




class DataController {
  static List<ProductModel> products = AppData2.products2;

  static StreamSubscription? _sub;

  static void start() {
    _sub = WebSocketService().stream.listen((data) {
      final now = DateTime.now();
      final time = DateFormat('mm:ss').format(now);

      _handleState(data.toString(), time);
    });
  }

  static void stop() {
    _sub?.cancel();
  }

  // ✅ نفس منطق handleIncomingState بالظبط
  static void _handleState(String state, String time) {

    // 🚫 تجاهل Waiting
    if (state == "Waiting...") return;

    // 🟢 أول session
    if (products.isEmpty) {
      products.add(
        ProductModel(
          name: state,
          icon: geticon(state),
          color: getColor(state),
          startDt: time,
          endDt: null,
          minutes: 0,
        ),
      );

      return;
    }

    final last = products.last;

    // ✅ نفس الحالة ولسه شغالة → كمل
    if (last.name == state && last.endDt == null) {
      return;
    }

    // 🔴 اقفل القديمة لو مفتوحة
    if (last.endDt == null) {
      last.endDt = time;
    }

    // 🆕 افتح session جديدة
    products.add(
      ProductModel(
        name: state,
        icon: geticon(state),
        color: getColor(state),
        startDt: time,
        endDt: null,
        minutes: 0,
      ),
    );
  }
}
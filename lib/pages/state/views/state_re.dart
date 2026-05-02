// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:study_lamp/core/app_colors.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//     int touchedIndex = -1;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar:AppBar(
//       backgroundColor: AppColors.background,
//       title: Text(
//           'Home',
//           style: TextStyle(
//             fontSize: 25,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         toolbarHeight: 30,
//       ) ,
//       body: Column(
//         children: [
//           SizedBox(
//       height: 180,
//       child: PieChart(
//         PieChartData(
//           centerSpaceRadius: 40,
//           sectionsSpace: 2,

//           // أهم جزء 👇
//           pieTouchData: PieTouchData(
//             touchCallback: (event, response) {
//               setState(() {
//                 if (!event.isInterestedForInteractions ||
//                     response == null ||
//                     response.touchedSection == null) {
//                   touchedIndex = -1;
//                   return;
//                 }
//                 touchedIndex =
//                     response.touchedSection!.touchedSectionIndex;
//               });
//             },
//           ),

//           sections: List.generate(3, (index) {
//             final isTouched = index == touchedIndex;

//             final data = [
//               {"value": 70.0, "color": const Color(0xFF7AA6FF)},
//               {"value": 20.0, "color": const Color(0xFFA855F7)},
//               {"value": 10.0, "color": const Color(0xFFFF6B6B)},
//             ];

//             return PieChartSectionData(
//               value: data[index]["value"] as double,
//               color: data[index]["color"] as Color,

//               // هنا السحر 👇
//               radius: isTouched ? 24 : 18,

//               showTitle: false,
//             );
//           }),
//         ),
//       ),
//     ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart'; 
import 'package:gap/gap.dart';
import 'package:study_lamp/core/app_colors.dart';
import 'package:study_lamp/pages/current_stute/model/appdata.dart';
import 'package:study_lamp/pages/current_stute/model/productmodel.dart'; 
import 'package:study_lamp/pages/state/widget/adva.dart';
import 'package:study_lamp/pages/state/widget/bar_shart.dart';
import 'package:study_lamp/pages/state/widget/juice.dart';
import 'package:study_lamp/pages/state/widget/pie_chart.dart'; 

class StateRe extends StatefulWidget {
  const StateRe({super.key});

  @override
  State<StateRe> createState() => _StateDistributionCardState();
}

class _StateDistributionCardState extends State<StateRe> {

  
   final source =
    AppData.products ;

late final topState = getTopState(source as List);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.background,
       appBar: AppBar(
          backgroundColor: AppColors.background,
          leadingWidth: 22,
          leading: Icon(Icons.menu, color: AppColors.secondaryColor, size: 30),
          title: Text(
            'Session Summary',
            style: TextStyle(
              fontSize: 25,
              color: AppColors.textColor_wihte,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 30,
        ),
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15.0),
         child: SingleChildScrollView(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Gap(40),
              Barchart( ),
               Gap(10),
              PieChart1( ),
                Gap(10),
              Adva(source: topState,  ),
              Gap(10),
              Juice(source: topState,),
            ],
           ),
         ),
       ),
    )
    ;  }
}

String getTopState(List source) {
  if (source.isEmpty) return "";

  Map<String, double> grouped = {};

  for (var item in source) {
    if (item is! ProductModel) continue;

    final state = item.name;
    final minutes = item.minutes?.toDouble();

    grouped[state] = (grouped[state] ?? 0) + minutes!;
  }

  if (grouped.isEmpty) return "";

  String topState = "";
  double maxValue = 0;

  grouped.forEach((key, value) {
    if (value > maxValue) {
      maxValue = value;
      topState = key;
    }
  });

  return topState;
}
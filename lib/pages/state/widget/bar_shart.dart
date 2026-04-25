//  import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class Barchart extends StatefulWidget {
//   const Barchart({super.key,  });

//   @override
//   State<Barchart> createState() => _BarchartState();
// }

// class _BarchartState extends State<Barchart> {


// // كل عنصر = فترة زمنية + عدد الساعات + الحالة
// final List<Map<String, dynamic>> sessions = [
//   {"time": "9-10", "hours": 1.0, "state": "Distracted"},
//   {"time": "10-11", "hours": 2.0, "state": "Fatigued"},
//   {"time": "11-12", "hours": 3.5, "state": "Focused"},
//   {"time": "12-1", "hours": 2.5, "state": "Focused"},
//   {"time": "1-2", "hours": 4.0, "state": "Focused"}, // أعلى تركيز
//   {"time": "2-3", "hours": 1.5, "state": "Fatigued"},
//   {"time": "3-4", "hours": 0.5, "state": "Distracted"},
// ];

// // أعلى قيمة Focus
// late double maxFocus = sessions
//     .where((e) => e["state"] == "Focused")
//     .map((e) => e["hours"] as double)
//     .fold(0.0, (a, b) => a > b ? a : b);

// // أقصى عدد ساعات (علشان نحدد Y-axis)
// late double maxY = sessions
//     .map((e) => e["hours"] as double)
//     .fold(0.0, (a, b) => a > b ? a : b);




//   @override
//   Widget build(BuildContext context) {
//     return     Container(
//   padding: const EdgeInsets.all(16),
//   decoration: BoxDecoration(
//     color: const Color(0xFF1C222B),
//     borderRadius: BorderRadius.circular(24),
//   ),

//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [

//       const Text(
//         "Focus Fluctuation",
//         style: TextStyle(color: Colors.white, fontSize: 18),
//       ),

//       const SizedBox(height: 6),

//       // ===== أفضل وقت =====
//       Text(
//         "Best Focus: ${sessions.firstWhere((e) => e["hours"] == maxFocus)["time"]}",
//         style: const TextStyle(color: Colors.greenAccent),
//       ),

//       const SizedBox(height: 20),

//       SizedBox(
//         height: 220,

//         child: BarChart(
//           BarChartData(

//             maxY: maxY + 1, 
//             // أعلى نقطة في Y-axis (بنزود 1 عشان يبقى فيه مساحة فوق)

//             gridData: FlGridData(
//               show: true,
//               drawVerticalLine: false, // نلغي الخطوط العمودية
//               getDrawingHorizontalLine: (value) {
//                 return FlLine(
//                   color: Colors.white10,
//                   strokeWidth: 1,
//                 );
//               },
//             ),
//             // خطوط خفيفة في الخلفية

//             borderData: FlBorderData(show: false),

//             // ===== AXIS =====
//             titlesData: FlTitlesData(

//               // ===== X AXIS =====
//               bottomTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   reservedSize: 30,

//                   getTitlesWidget: (value, meta) {
//                     int index = value.toInt();

//                     if (index >= sessions.length) return const SizedBox();

//                     return Text(
//                       sessions[index]["time"],
//                       style: const TextStyle(
//                         color: Colors.grey,
//                         fontSize: 10,
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               // ===== Y AXIS =====
//               leftTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   reservedSize: 30,

//                   getTitlesWidget: (value, meta) {
//                     return Text(
//                       "${value.toInt()}h",
//                       style: const TextStyle(
//                         color: Colors.grey,
//                         fontSize: 10,
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               topTitles: AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),

//               rightTitles: AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),
//             ),

//             // ===== BARS =====
//             barGroups: List.generate(sessions.length, (index) {

//               final item = sessions[index];
//               final hours = item["hours"] as double;

//               final isBest = hours == maxFocus;

//               // لون حسب الحالة
//               Color color;
//               switch (item["state"]) {
//                 case "Focused":
//                   color = const Color(0xFF5B7DB1);
//                   break;
//                 case "Fatigued":
//                   color = const Color(0xFFA855F7);
//                   break;
//                 default:
//                   color = const Color(0xFFFF6B6B);
//               }

//               return BarChartGroupData(
//                 x: index,

//                 barRods: [
//                   BarChartRodData(
//                     toY: hours, // عدد الساعات

//                     width: 16,

//                     borderRadius: BorderRadius.circular(6),

//                     color: isBest
//                         ? const Color(0xFF59FF7A)
//                         : color,
//                     // أعلى تركيز أخضر
//                   ),
//                 ],
//               );
//             }),
//           ),
//         ),
//       ),
//     ],
//   ),
// )
       
// ;
//   }
// }

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:study_lamp/pages/current_stute/model/appdata.dart';

class Barchart extends StatefulWidget {
  const Barchart({super.key});

  @override
  State<Barchart> createState() => _BarchartState();
}

class _BarchartState extends State<Barchart> {
  int touchedIndex = -1;

  // =========================
  // DEFAULT DATA
  // =========================
  final List<Map<String, dynamic>> defaultSessions = [
    {
      "state": "focus",
      "minutes": 30.0,
      "start": "12:00",
      "end": "12:30",
      "color": Colors.blue,
    },
    {
      "state": "stressed",
      "minutes": 15.0,
      "start": "12:30",
      "end": "12:45",
      "color": Colors.red,
    },
    {
      "state": "tired",
      "minutes": 20.0,
      "start": "12:45",
      "end": "13:05",
      "color": Colors.purple,
    },
  ];

  // =========================
  // LIVE DATA
  // =========================
  List<Map<String, dynamic>> get sessions {
    if (AppData.products.isEmpty) return defaultSessions;

    return AppData.products.map((item) {
      return {
        "state": item.name,
        "minutes": item.minutes ?? 0,
        "start": item.startDt ?? "-",
        "end": item.endDt ?? "now",
        "color": item.color,
      };
    }).toList();
  }

  // =========================
  // GROUP BY STATE (IMPORTANT FIX)
  // =========================
  List<Map<String, dynamic>> get groupedSessions {
    Map<String, Map<String, dynamic>> map = {};

    for (var s in sessions) {
      final key = s["state"];

      if (!map.containsKey(key)) {
        map[key] = {
          "state": key,
          "minutes": 0.0,
          "color": s["color"],
        };
      }

      map[key]!["minutes"] += (s["minutes"] as num).toDouble();
    }

    return map.values.toList();
  }

  // =========================
  // BEST STATE (MAX TOTAL MINUTES)
  // =========================
  Map<String, dynamic> get bestState {
    if (groupedSessions.isEmpty) return {};

    return groupedSessions.reduce((a, b) {
      return a["minutes"] > b["minutes"] ? a : b;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = groupedSessions;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C222B),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Focus Analysis",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),

          const SizedBox(height: 6),

          // =========================
          // BEST STATE SUMMARY
          // =========================
          Text(
            bestState.isEmpty
                ? "No Data"
                : "Top State: ${bestState["state"]} (${bestState["minutes"].toInt()} min)",
            style: const TextStyle(color: Colors.greenAccent),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 240,
            child: BarChart(
              BarChartData(
                maxY: (data.isEmpty
                        ? 1
                        : data
                                .map((e) => e["minutes"] as double)
                                .reduce((a, b) => a > b ? a : b)) +
                    5,

                gridData: FlGridData(show: true, drawVerticalLine: false),

                borderData: FlBorderData(show: false),

                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,

                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= data.length) return const SizedBox();

                        return Text(
                          data[index]["state"],
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 11),
                        );
                      },
                    ),
                  ),

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          "${value.toInt()}m",
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 10),
                        );
                      },
                    ),
                  ),

                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),

                // =========================
                // BARS
                // =========================
                barGroups: List.generate(data.length, (index) {
                  final item = data[index];
                  final minutes = item["minutes"] as double;

                  final isBest =
                      item["state"] == bestState["state"];

                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: minutes,
                        width: 18,
                        borderRadius: BorderRadius.circular(6),
                        color: isBest
                            ? const Color(0xFF59FF7A)
                            : item["color"],
                      ),
                    ],
                  );
                }),

                // =========================
                // TOUCH (SHOW DETAILS)
                // =========================
                barTouchData: BarTouchData(
                  enabled: true,
                  touchCallback: (event, response) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          response == null ||
                          response.spot == null) {
                        touchedIndex = -1;
                        return;
                      }

                      touchedIndex =
                          response.spot!.touchedBarGroupIndex;
                    });
                  },
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final item = data[group.x.toInt()];

                      return BarTooltipItem(
                        "Start: ${item["state"]}\n"
                        "Minutes: ${item["minutes"].toInt()}",
                        const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
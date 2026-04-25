import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:study_lamp/customs/custom_second_text.dart';
import 'package:study_lamp/pages/current_stute/model/appdata.dart';
import 'package:study_lamp/pages/current_stute/model/iconstate.dart';
import 'package:study_lamp/pages/current_stute/views/stute.dart';

class PieChart1 extends StatefulWidget {
  
  const PieChart1(   {super.key, this.index,  });

final int? index;
  @override
  State<PieChart1> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart1> {
  @override
  Widget build(BuildContext context) {


int touchedIndex = -1; 
   

  final List<Map<String, dynamic>> defaultData = [
    {"title": "Focused", "value": 70.0, "color": Color(0xFF7AA6FF)},
    {"title": "Fatigued", "value": 20.0, "color": Color(0xFFA855F7)},
    {"title": "Distracted", "value": 5.0, "color": Color(0xFFFF6B6B)},
      {"title": "Distracted", "value": 5.0, "color": Color.fromARGB(255, 22, 132, 70)},
  
  ];
List<Map<String, dynamic>> getChartData() {
  if (AppData.products.isEmpty) {
    return [];
  }

  Map<String, double> result = {};

  for (var item in AppData.products) {
    final key = item.name;

    result[key] = (result[key] ?? 0) + item.minutes!.toDouble();
  }

  return result.entries.map((e) {
    return {
      "title": e.key,
      "value": e.value,
      "color": getColor(e.key),
    };
  }).toList();
}
final liveData = getChartData();
final data = liveData.isEmpty ? defaultData : liveData;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
        
             Container(
            height: 220,
            padding: const EdgeInsets.all(16),  
            decoration: BoxDecoration(
              color: const Color(0xFF1C222B),  
              borderRadius: BorderRadius.circular(24), 
            ),
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 SecondCustomeText(text: 'State Distribution', fontSize: 22,),
               Gap(15),
                Row(
                  children: [
                     
                    
                    Stack(
                      alignment: Alignment.center,
                      children: [
                          
                        SizedBox(
                          height: 140,
                          width: 140,
                          
                          child: PieChart(
                            PieChartData(
                          
                              centerSpaceRadius: 45, 
                            
                          
                              sectionsSpace: 3, 
                               
                          
                              
                              pieTouchData: PieTouchData(
                                touchCallback: (event, response) {
                                  setState(() {
                                     
                                    if (!event.isInterestedForInteractions ||
                                        response == null ||
                                        response.touchedSection == null) {
                                      touchedIndex = -1;  
                                      return;
                                    }
                          
                                  
                                    touchedIndex =
                                        response.touchedSection!.touchedSectionIndex;
                                  });
                                },
                              ),
                          
                               
                              sections: List.generate(data.length, (index) {
                          
                                final isTouched = index == touchedIndex;
                                
                          
                                return PieChartSectionData(
                                  value: data[index]["value"],  
                                  color: data[index]["color"],  
                          
                                  radius: isTouched ? 26 : 20,
                                  
                          
                                  showTitle: isTouched,
                                  
                          
                                  title: isTouched
                                      ? "${data[index]["value"].toInt()}%"
                                      : "",
                          
                                  titleStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                          
                                  // ===== Glow Effect =====
                                  borderSide: isTouched
                                      ? BorderSide(
                                          color: Colors.white.withOpacity(0.5),
                                          width: 2,
                                        )
                                      : BorderSide.none,
                                   
                                );
                              }),
                            ),
                          
                            swapAnimationDuration:
                                const Duration(milliseconds: 300),
                            
                          ),
                        ),
                          
                        
                        const Icon(
                          Icons.psychology,
                          color: Colors.white70,
                          size: 28,
                        ),
                      ],
                    ),
                          
                    const SizedBox(width: 20),
                          
                   
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                             
                        children: List.generate(data.length, (index) {
                                
                          final item = data[index];
                                
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                                
                            child: Row(
                              children: [
                                
                              
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: item["color"],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                
                                const SizedBox(width: 10),
                                
                                // اسم الحالة
                                Expanded(
                                  child: Text(
                                    item["title"],
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                
                                // النسبة
                                Text(
                                  "${item["value"].toInt()}%",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
       
     
        ],
      ),
    );
 
  }
}
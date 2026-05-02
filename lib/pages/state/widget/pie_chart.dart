import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:study_lamp/customs/custom_second_text.dart';
import 'package:study_lamp/pages/current_stute/model/appdata.dart';
import 'package:study_lamp/pages/current_stute/model/productmodel.dart';

class PieChart1 extends StatefulWidget {
  const PieChart1({super.key, this.index});

  final int? index;

  @override
  State<PieChart1> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart1> {
  int touchedIndex = -1;

  // =========================
  // FAKE DATA (Map فقط للبديل)
  // =========================
  final List<Map<String, dynamic>> defaultData = [
    {
      "state": "Focus",
      "minutes": 30.0,
      "color": const Color(0xFF1E88E5),
    },
    {
      "state": "Stressed",
      "minutes": 30.0,
      "color": const Color(0xFFFB8C00),
    },
    {
      "state": "Tired",
      "minutes": 20.0,
      "color": const Color(0xFF90A4AE),
    },
    {
      "state": "Happy",
      "minutes": 25.0,
      "color": const Color(0xFFFDD835),
    },
    {
      "state": "Surprised",
      "minutes": 10.0,
      "color": const Color(0xFFBA68C8),
    },
    {
      "state": "Angry",
      "minutes": 15.0,
      "color": const Color(0xFFE53935),
    },
  ];

  // =========================
  // SAFE NORMALIZATION (Map + Model)
  // =========================
  List<Map<String, dynamic>> normalizeSource(List source) {
    List<Map<String, dynamic>> result = [];

    for (var item in source) {
      // ProductModel
      if (item is ProductModel) {
        result.add({
          "state": item.name ?? "Unknown",
          "minutes": (item.minutes ?? 0).toDouble(),
          "color": item.color ?? const Color(0xFF9E9E9E),
        });
      }

      // fallback Map
      else if (item is Map) {
        result.add({
          "state": item["state"] ?? "Unknown",
          "minutes": (item["minutes"] ?? 0).toDouble(),
          "color": item["color"] ?? const Color(0xFF9E9E9E),
        });
      }
    }

    return result;
  }

  // =========================
  // GROUP + PERCENTAGE
  // =========================
  List<Map<String, dynamic>> getChartData(List source) {
    final dataSource = normalizeSource(source);

    if (dataSource.isEmpty) return [];

    Map<String, double> grouped = {};
    Map<String, Color> colors = {};

    for (var item in dataSource) {
      final state = item["state"].toString();
      final minutes = (item["minutes"] as num).toDouble();
      final color = item["color"] as Color;

      grouped[state] = (grouped[state] ?? 0) + minutes;
      colors[state] = color;
    }

    double total = grouped.values.fold(0.0, (a, b) => a + b);

    if (total == 0) return [];

    return grouped.entries.map((e) {
      final percent = (e.value / total) * 100;

      return {
        "title": e.key,
        "value": percent,
        "color": colors[e.key] ?? const Color(0xFF9E9E9E),
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final source =
        AppData.products.isNotEmpty ? AppData.products : defaultData;

    final data = getChartData(source);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 320,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1C222B),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                SecondCustomeText(
                  text: 'State Distribution',
                  fontSize: 22,
                ),
                const Gap(15),

                Row(
                  children: [
                    // PIE
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

                                    touchedIndex = response
                                        .touchedSection!
                                        .touchedSectionIndex;
                                  });
                                },
                              ),
                              sections: List.generate(data.length, (index) {
                                final isTouched = index == touchedIndex;
                                final value =
                                    (data[index]["value"] ?? 0) as num;

                                return PieChartSectionData(
                                  value: value.toDouble(),
                                  color: data[index]["color"],
                                  radius: isTouched ? 26 : 20,
                                  showTitle: isTouched,
                                  title:
                                      isTouched ? "${value.toInt()}%" : "",
                                  titleStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  borderSide: isTouched
                                      ? BorderSide(
                                          color: Colors.white.withOpacity(0.5),
                                          width: 2,
                                        )
                                      : BorderSide.none,
                                );
                              }),
                            ),
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

                    // LEGEND
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(data.length, (index) {
                          final item = data[index];

                          final title = item["title"].toString();
                          final value = (item["value"] as num);

                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 6),
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
                                Expanded(
                                  child: Text(
                                    title,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${value.toInt()}%",
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
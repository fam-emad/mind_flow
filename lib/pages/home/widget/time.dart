import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

/// ===============================
/// CONTROLLER (منطق التايمر)
/// ===============================
///
enum TimerType { work, breakTime }

class TimerController extends ChangeNotifier {
  double workMinutes;
  double breakMinutes;
  int totalCircles;
  int remainingSeconds;

  Timer? _timer;
  bool isRunning = false;

  int currentCircle = 1;
  TimerType currentType = TimerType.work;
bool isSessionCompleted = false;
  bool isBreakTime = false;

  /// 👇 تقدر تحدد القيمة من برا
  TimerController({
    this.workMinutes = 0.1,
    this.breakMinutes = 2,
    this.totalCircles = 2,
  }) : remainingSeconds = (workMinutes * 60).toInt();

  /// تغيير الوقت من السلايدر

  /// بدء التايمر (Countdown)
  void start() {
    isSessionCompleted = false;
    if (isRunning) return;
    _timer?.cancel(); // تأكيد إضافي إن مفيش بقايا تايمر قديم
    isRunning = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
      } else {
        _handleSessionEnd();
      }
      notifyListeners();
    });
    notifyListeners();
  }

  /// إيقاف
  void stop() {
    _timer?.cancel();
    isRunning = false;
    notifyListeners();
  }

  /// إعادة ضبط
  void reset() {
    _timer?.cancel();

    workMinutes = 0;
    remainingSeconds = 0;

    isRunning = false;

    notifyListeners();
  }

  void _resetToStart() {
    currentCircle = 1;
    workMinutes = 0;
    currentType = TimerType.work;
    remainingSeconds = (workMinutes * 60).toInt();
  }

  // void _handleSessionEnd() {
  //     if (currentType == TimerType.work) {
  //       // خلصنا شغل، هل في راحة؟
  //       currentType = TimerType.breakTime;
  //       remainingSeconds = (breakMinutes * 60).toInt();
  //       isBreakTime=true;
  //     } else {
  //       // خلصنا راحة، هل في دورة جديدة؟
  //       if (currentCircle < totalCircles) {
  //          isBreakTime=false;
  //         currentCircle++;
  //         currentType = TimerType.work;
  //         remainingSeconds = (workMinutes * 60).toInt();
  //       } else {
  //         // خلصنا كل الـ Circles
  //         stop();
  //         isRunning=false;
  //         _resetToStart();
  //         isBreakTime=false;
  //       }
  //     }
  //   }
  void _handleSessionEnd() {
    if (currentType == TimerType.work) {
      // 👇 لو دي آخر دائرة → وقف ومفيش break
      if (currentCircle == totalCircles) {
        stop();
        isRunning = false;
         isSessionCompleted = true;
        // _resetToStart();
        isBreakTime = false;
        return;
      }

      // 👇 غير كده روح للـ break
      currentType = TimerType.breakTime;
      remainingSeconds = (breakMinutes * 60).toInt();
      isBreakTime = true;
    } else {
      // 👇 خلصنا break → نرجع work
      currentCircle++;
      currentType = TimerType.work;
      remainingSeconds = (workMinutes * 60).toInt();
      isBreakTime = false;
    }
  }

  /// تنسيق الوقت
  String formatTime() {
    int minutes = remainingSeconds ~/ 60;
    int sec = remainingSeconds % 60;

    return "${minutes.toString().padLeft(2, '0')}:"
        "${sec.toString().padLeft(2, '0')}";
  }

  /// نسبة التقدم (علشان الدايرة)
  double get progress {
    double total = workMinutes * 60;
    return ((total - remainingSeconds) / total).clamp(0.0, 1.0);
  }

  void disposeController() {
    _timer?.cancel();
  }
}

class TimerView extends StatelessWidget {
  final TimerController controller;

  const TimerView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// 🔥 الجلو (Glow) اللي ورا الدايرة
              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: controller.isRunning
                          ? Colors.greenAccent.withOpacity(0.25)
                          : const Color.fromARGB(
                              255,
                              233,
                              81,
                              155,
                            ).withOpacity(0.25),

                      blurRadius: 80,
                      spreadRadius: 10,
                    ),
                  ],
                ),
              ),

              /// 🎯 السلايدر نفسه
              SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: controller.progress * 100,

                // onChange: controller.isRunning
                //     ? null
                //     : (value) {
                //      //   controller.setMinutes(value);
                //       },
                appearance: CircularSliderAppearance(
                  size: 250,
                  startAngle: 270,
                  angleRange: 360,
                  customWidths: CustomSliderWidths(
                    trackWidth: 6,
                    progressBarWidth: 10,
                  ),
                  customColors: CustomSliderColors(
                    progressBarColors: [
                      controller.isRunning
                          ? Colors.greenAccent
                          : Colors.redAccent,
                      Colors.blueAccent,
                    ],
                    trackColor: Colors.white12,
                    dotColor: Colors.white,
                  ),
                ),

                innerWidget: (_) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "DEEP WORK",
                        style: TextStyle(
                          color: controller.isRunning
                              ? Colors.greenAccent
                              : Colors.blueAccent,

                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// ⏱ الوقت
                      Text(
                        controller.formatTime(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Circle ${controller.currentCircle} / ${controller.totalCircles}",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

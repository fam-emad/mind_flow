import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:study_lamp/core/app_colors.dart';
import 'package:study_lamp/customs/custom_second_text.dart';
import 'package:study_lamp/pages/current_stute/model/appdata.dart';
import 'package:study_lamp/pages/current_stute/widget/CustomBox.dart';
import 'package:study_lamp/pages/home/views/appdata.dart';
import 'package:study_lamp/pages/home/views/data/box.dart';
import 'package:study_lamp/pages/home/views/stateeee.dart'; 
import 'package:study_lamp/pages/home/widget/btms.dart';
import 'package:study_lamp/pages/home/widget/btmsheet.dart';
import 'package:study_lamp/pages/home/widget/btnPuse.dart';
import 'package:study_lamp/pages/home/widget/focus.dart';
import 'package:study_lamp/pages/home/widget/sittings/btm.dart';
import 'package:study_lamp/pages/home/widget/sittings/cycles.dart';
import 'package:study_lamp/pages/home/widget/sittings/settings.dart';
import 'package:study_lamp/pages/home/widget/slider.dart';
import 'package:study_lamp/pages/home/widget/time.dart';
import 'package:study_lamp/pages/state/widget/adva.dart';
import 'package:study_lamp/pages/state/widget/adva2.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  double sectime = 0;
  double localValue = 0; // 👈 نسخة محلية
  double localValue1 = 0;
  int localCycles = 4;
  late var controller = TimerController(
    workMinutes: localValue,
    breakMinutes: localValue1,
  );
  bool start = true;
  bool ornot = true;
   late Timer timer;

    @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 2), (_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.disposeController();
     timer.cancel();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(
                start
                    ? 100
                    : !controller.isBreakTime
                    ? 70
                    : 50,
              ),
              Gap(!controller.isBreakTime ? 1 : 0),
              TimerView(controller: controller),

              AnimatedBuilder(
                animation: controller,
                builder: (context, _) {
                  return Column(
                    children: [
                      if (!controller.isBreakTime) ...[
                        if (start == false) ...[
                          Gap(40),
                          Focusstat(
                            color: controller.currentType == TimerType.work
                                ? AppColors.grean
                                : AppColors.secondaryColor,
                            text: controller.currentType == TimerType.work
                                ? "WORK"
                                : "BREAK",
                          ),
                          const SizedBox(height: 15),

                          /// 🧠 Sub text
                          const Text(
                            "Synced with MindFlow IoT Hub",
                            style: TextStyle(color: Colors.white38),
                          ),
                          Gap(40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Btms(
                                icon: Icons.stop,
                                ontap: () {
                                  setState(() {
                                    start = true;

                                    controller.disposeController();

                                    controller = TimerController(
                                      workMinutes: sectime,
                                    );

                                    controller.reset();
                                  });
                                },
                              ),
                              Gap(30),
                              Btnpuse(
                                ontap: () {
                                  setState(() {
                                    controller.isRunning
                                        ? controller.stop()
                                        : controller.start();
                                  });
                                },

                                icon: controller.isRunning
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              Gap(30),
                              Btms(icon: Icons.skip_next, ontap: () {}),
                            ],
                          ),
                          if (controller.isSessionCompleted) ...[
                            // --- الزر الموجود في المنتصف ---
                            Gap(20),
                            SizedBox(
                              width: 300,

                              child: ElevatedButton(
                                onPressed: () {
                                  WidgetsBinding.instance.addPostFrameCallback((
                                    _,
                                  ) {
                                    showSummaryBottomSheet(context);
                                  });
                                  //Navigator.pushReplacement(context , MaterialPageRoute(builder: (c) => MainScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF89B4FA),
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 50,
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 10,
                                  shadowColor: const Color(
                                    0xFF8EBAFF,
                                  ).withOpacity(0.5),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'state',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.stay_current_landscape_outlined,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ] else ...[
                          Gap(30),
                          SizedBox(
                            width: 300,
                            height: 55,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    AppColors.secondaryColor, // أحمر
                                elevation: 10, // قوة الشادو
                                shadowColor: Colors.blueAccent.withOpacity(
                                  0.5,
                                ), // لون الشادو
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setModalState) {
                                        return Container(
                                          width: double.infinity,
                                          height: 430,
                                          margin: const EdgeInsets.all(16),
                                          padding: const EdgeInsets.all(24),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF1A1F26),
                                            borderRadius: BorderRadius.circular(
                                              25,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                "New Focus Session",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 6),

                                              const Text(
                                                "Configure your focus parameters",
                                                style: TextStyle(
                                                  color: Colors.white54,
                                                ),
                                              ),

                                              Gap(25),
                                              Slider1(
                                                title: "Work Duration",
                                                value: localValue,
                                                color: AppColors.secondaryColor,
                                                onChanged: (double value) {
                                                  setModalState(() {
                                                    localValue =
                                                        value; // 👈 يحدث UI فورًا
                                                  });
                                                },
                                              ),
                                              Gap(10),
                                              Slider1(
                                                title: "Work Duration",
                                                value: localValue1,
                                                color: AppColors.grean,
                                                onChanged: (double value) {
                                                  setModalState(() {
                                                    localValue1 =
                                                        value; // 👈 يحدث UI فورًا
                                                  });
                                                },
                                              ),
                                              const SizedBox(height: 20),
                                              Cycles(
                                                initialValue: localCycles,
                                                onChanged: (newValue) {
                                                  // السطر ده هو اللي "بيخزن" الرقم بره أول بأول
                                                  localCycles = newValue;
                                                },
                                              ),
                                              const SizedBox(height: 20),
                                              btm(
                                                ontap: () {
                                                   DataController.start();
                                                    Text("Start");
                                                  setState(() {
                                                    sectime = localValue;

                                                    controller
                                                        .disposeController(); // اقفل القديم
                                                    controller = TimerController(
                                                      // workMinutes: sectime,
                                                      // breakMinutes: localValue1,
                                                      // totalCircles: localCycles,
                                                    ); //
                                                    print("             ");
                                                    print(sectime);
                                                    print("             ");
                                                    print(localValue1);
                                                    print("             ");
                                                    print(localCycles);
                                                    print("             ");

                                                    /// controller.addListener(_timerListener);
                                                    controller.start();
                                                    start = false;
                                                    Navigator.pop(context);
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Start Session",
                                style: TextStyle(
                                  color: AppColors.btmcolortxt,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Gap(50),
                          //Adva(),
                          InfoCard(
                            title: "Peak Focus Detected",
                            description:
                                "Your brain is most receptive now. Avoid distractions for the next 25 minutes for maximum retention.",
                            icon: Icons.auto_awesome,
                          ),
                        ],
                      ] else ...[
                        Focusstat(
                          color: controller.currentType == TimerType.work
                              ? AppColors.grean
                              : AppColors.red,
                          text: controller.currentType == TimerType.work
                              ? "WORK"
                              : "BREAK",
                        ),
                        Gap(6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Btms(
                              icon: Icons.stop,
                              ontap: () {
                                setState(() {
                                  start = true;

                                  controller.disposeController();

                                  controller = TimerController(
                                    workMinutes: sectime,
                                  );

                                  controller.reset();
                                });
                              },
                            ),
                            Gap(30),
                            Btnpuse(
                              ontap: () {
                                setState(() {
                                  controller.isRunning
                                      ? controller.stop()
                                      : controller.start();
                                });
                              },

                              icon: controller.isRunning
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                            Gap(30),
                            Btms(icon: Icons.skip_next, ontap: () {}),
                          ],
                        ),

                        Container(
                          height: 245,
                          width: 370,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            // color: const Color(0xFF1C222B),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SecondCustomeText(
                                  text: 'State Distribution',
                                  fontSize: 22,
                                ),
                                Gap(15),
                                 Column(
  children: buildCustomBoxList(AppData2.products2),
)

                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

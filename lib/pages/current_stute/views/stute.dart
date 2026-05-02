//  import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:intl/intl.dart';
// import 'package:study_lamp/core/app_colors.dart';
// import 'package:study_lamp/pages/current_stute/views/iconstate.dart';
// import 'package:study_lamp/pages/current_stute/widget/custom_btm.dart';
// import 'package:study_lamp/customs/custom_second_text.dart';
// import 'package:study_lamp/pages/current_stute/widget/CustomBox.dart';
// import 'package:study_lamp/pages/current_stute/widget/productmodel.dart';

// class CurrentStute extends StatefulWidget {
//   const CurrentStute({super.key});

//   @override
//   State<CurrentStute> createState() => _RealTimeState();
// }

// class _RealTimeState extends State<CurrentStute> {
 
 
//   String currentTime = "";
//   String startTime = "";
//   late Timer timer;
//   DateTime  startDT = DateTime.now();

//   late Timer addItemTimer;
//   late List<ProductModel> products = [];
//   Duration? diff;

//   bool isRunning = true;
//   bool islouding = false;
//   @override
//   void initState() {
//     super.initState();
//      Future.delayed(  Duration(seconds: 5),(){
//      islouding=true;
//      });
//     updateTime();

//    //startDT = DateTime.now();
// startTime = DateFormat('HH:mm:ss').format(startDT);

// timer = Timer.periodic(Duration(seconds: 1), (timer) {
//  // updateTime();

//   if (products.isNotEmpty) {
//     setState(() {
//       final now = DateTime.now();

//       for (var item in products) {
//         final start = DateFormat('HH:mm:ss').parse(item.startDt!);
//   if (item.endDt == null) {
//         item.minutes = now.difference(start).inSeconds;
//       }}
//     });
//   }
// });

//     addItemTimer = Timer.periodic(Duration(seconds: 6), (timer) {
//       addNewItem();
//     });
//   }

//   void updateTime() {
//     setState(() {
//       DateTime endDT = DateTime.now();
//       currentTime = DateFormat('HH:mm:ss').format(endDT); // نفس الـ format
//      // diff = endDT.difference(startDT);
//     });
//   }

//   void stopTimer() {
//     setState(() {
//       isRunning = false;
//     });

//     timer.cancel();
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     addItemTimer.cancel();
//     super.dispose();
//   }


// String newStatus = getRandomStatus();
//   void addNewItem() {
//     setState(() {
//       String now = DateFormat('HH:mm:ss').format(DateTime.now());

//       // 🔴 وقف آخر item
//       if (products.isNotEmpty) {
//         products.last.endDt = now;
//       }

//       if (products.isEmpty || products.last.name != getRandomStatus()) {
  
//   products.add(
//     ProductModel(
//       name: getRandomStatus(),
//       // خد بالك هنا بعتنا newStatus عشان نضمن إن الأيقونة واللون ماشيين مع نفس الاسم
//       icon: geticon(getRandomStatus()), 
//       color: getColor(getRandomStatus()),
//       startDt: now,
//       endDt: null, minutes: 0,
//     ),
//   );
  
// } else {
//   // هنا لو طلع الاسم الجديد هو هو آخر اسم في اللستة
//   print("الاسم متكرر مش هنضيف حاجة");
// }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       child: Scaffold(
//         backgroundColor: AppColors.background,
//         appBar: AppBar(
//           backgroundColor: AppColors.background,
//           leadingWidth: 22,
//           leading: Icon(Icons.menu, color: AppColors.secondaryColor, size: 30),
//           title: Text(
//             'MIndFlow',
//             style: TextStyle(
//               fontSize: 25,
//               color: AppColors.secondaryColor,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           centerTitle: false,
//           toolbarHeight: 30,
//         ),
//         body: islouding
//             ? Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Gap(20),
//                     CustomBtm(
//                       text: 'AI Monitor',
//                       colorfont: AppColors.textColor_wihte,
//                       fontSize: 40,
//                       height: 282,
//                       width: 342,
//                       iscolor: false,
//                     ),
//                     Row(
//                       children: [
//                         Gap(15),
//                         SecondCustomeText(
//                           text: 'Everything happening, right now :',
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),

//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: products.length,

//                         itemBuilder: (context, index) {
//                           final item = products[index];
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: CustomBox(
//                               height: 90,
//                               width: 342,
//                               radius: 32,
//                               text: item.name,
//                               fontSize: 19,
//                               iscolor: true,
//                               icon:  geticon(item.name),
//                               iconcolor: getColor(item.name),
//                               text2: item.endDt == null
//                                   ? '${item.startDt} To Now'
//                                   : '${item.startDt} To ${item.endDt}',
//                                   mintxt: " ${item.minutes} ",
//                              // mintxt: " ${diff?.inMinutes.toString()} ",
//                               // onTap: stopTimer,
//                             ),
//                           );
//                         },
//                       ),
//                     ),

//                     // CustomBox(
//                     //   height: 90,
//                     //   width: 342,
//                     //   radius: 32,
//                     //   text: 'focused',
//                     //   fontSize: 19,
//                     //   iscolor: true,
//                     //   icon: Icons.alarm,
//                     //   iconcolor: AppColors.secondaryColor,
//                     //   text2: '${startTime} To ${currentTime}',
//                     //   mintxt: " ${diff?.inMinutes.toString()} ",
//                     //   onTap: stopTimer,
//                     // ),

//                     //Gap(300),
//                   ],
//                 ),
//               )
//             : Center(
//                 child: Container(
                  
//                   height: 290,
//                   width: 360,
//                   decoration: BoxDecoration( color: AppColors.box,borderRadius: BorderRadius.circular(22)),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SecondCustomeText(
//                         text: 'Wait for 5minutes',
//                         fontSize: 30,
//                       ),
//                       Gap(10),
//                       SizedBox(
//                         height: 60, // الطول اللي إنت عايزه
//                         width: 60,
//                         child: CircularProgressIndicator(
//                           backgroundColor: Colors.blue.withOpacity(0.2),
//                           strokeCap: StrokeCap.round,
//                           strokeWidth: 3.0,
//                           // value: 0.7,
//                           color: AppColors.grean,
//                         ),
//                       ),
//                       Gap(30),
//                        SecondCustomeText(
//                         text: 'ANALYZING COGMITIVE FLOW TATE...',
//                         fontSize: 12,
//                         fontWeight: FontWeight.w300,
//                       ),
//                       Gap(30),
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }
 
  import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:study_lamp/core/app_colors.dart';
import 'package:study_lamp/core/network/socket_service.dart';
import 'package:study_lamp/pages/current_stute/model/appdata.dart';
import 'package:study_lamp/pages/current_stute/model/iconstate.dart';
import 'package:study_lamp/pages/current_stute/widget/custom_btm.dart';
import 'package:study_lamp/customs/custom_second_text.dart';
import 'package:study_lamp/pages/current_stute/widget/CustomBox.dart';
import 'package:study_lamp/pages/current_stute/model/productmodel.dart';

//import 'websocket_service.dart'; // 👈 WebSocket import

class CurrentStute extends StatefulWidget {
  const CurrentStute({super.key});

  @override
  State<CurrentStute> createState() => _RealTimeState();
}

class _RealTimeState extends State<CurrentStute>  {
  // =========================
  // ⏱ TIME TRACKING VARIABLES
  // =========================
  String currentTime = "";
  String startTime = "";
  late Timer timer;
  Duration? diff;
  DateTime startDT = DateTime.now();

  // =========================
  // 🔌 WEBSOCKET DEBUG STATE
  // =========================
  bool isRunning = true;
  bool islouding = false;
  bool isConnected = false; // 👈 مهم لمعرفة حالة الاتصال

  // =========================
  // 📦 DATA LIST (sessions)
  // =========================
    late  List<ProductModel> products =  AppData.products;
           
  
 
StreamSubscription? subscription;
  // آخر state جاي من ESP
  String? lastState;

  @override
  void initState() {
    super.initState();

    // =========================
    // ⏳ LOADING SIMULATION
    // =========================
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        islouding = true;
      });
    });

    // =========================
    // ⏱ INIT TIME TRACKING
    // =========================
    startTime = DateFormat('hh:mm:ss:a').format(startDT);

timer = Timer.periodic(Duration(seconds: 1), (timer) {
 // updateTime();

  if (products.isNotEmpty) {
    setState(() {
      final now = DateTime.now();

      for (var item in products) {
        final start = DateFormat('hh:mm:ss').parse(item.startDt!);
  if (item.endDt == null) {
        item.minutes = now.difference(start).inSeconds;
        print(item.minutes);
      }}
    });
  }
});


    // =========================
    // 🔌 CONNECT TO ESP WEBSOCKET
    // =========================
    print("🔌 Trying to connect to ESP...");

   //WebSocketService().connect();

    // =========================
    // 👂 LISTEN TO MESSAGES
    // =========================
      // 👇 ده المهم
  subscription = WebSocketService().stream.listen(
    (data) {
       print("🔥 FROM ESP: $data"); // 👈 مهم جدًا
      final now = DateTime.now();
      final time = DateFormat('HH:mm:ss').format(now);

      print("📩 MESSAGE RECEIVED: $data at $time");

      handleIncomingState(data.toString(), time);
    },
    onDone: () {
      print("❌ CONNECTION CLOSED");
    },
    onError: (error) {
      print("💥 ERROR: $error");
    },
  );
    
  }
void handleIncomingState(String state, String time) {
  setState(() {

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

      print("🆕 First session started: $state");
      lastState = state;
      return;
    }

    final last = products.last;

    // ✅ نفس الحالة ولسه شغالة → كمل (ما تعملش حاجة)
    if (last.name == state && last.endDt == null) {
      print("🔁 Same state continues: $state");
      return;
    }

    // 🔴 اقفل القديمة (لو لسه مفتوحة)
    if (last.endDt == null) {
      last.endDt = time;
      print("⛔ Closing previous session at $time");
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

    print("🆕 New session started: $state");

    lastState = state;
  });
}
  // =========================
  // 📥 HANDLE ESP MESSAGE
  // =========================
//   void handleIncomingState(String state, String time) {
//     setState(() {
//       // لو عندك box شغال → اقفله
//       if (products.isNotEmpty) {
//         products.last.endDt = time;
//         print("⛔ Closing previous session at $time");
//       }

//       // لو نفس الحالة → تجاهل
//       if (lastState == state) {
//         print("⚠️ Same state ignored: $state");
//         return;
//       }
//  if (state != "Waiting..."){
//       // إنشاء session جديد
//       products.add(
//         ProductModel(
//           name: state,
//           icon: geticon(state),
//           color: getColor(state),
//           startDt: time,
//           endDt: null,
//            minutes: 0,
//         ),
//       );
//  }
//       print("🆕 New session started: $state at $time");

//       lastState = state;
//     });
//   }

  // =========================
  // ⏱ UPDATE TIMER
  // =========================
  void updateTime() {
    setState(() {
      DateTime endDT = DateTime.now();
      currentTime = DateFormat('HH:mm:ss').format(endDT);
      diff = endDT.difference(startDT);
    });
  }

  // =========================
  // 🛑 STOP TIMER
  // =========================
  void stopTimer() {
    setState(() {
      isRunning = false;
    });

    timer.cancel();

    print("🛑 Local timer stopped");
  }

  @override
  void dispose() {
    timer.cancel();
 subscription?.cancel(); // 🔥 أهم سطر
    print("⚠️ Page disposed, timer cancelled");

    super.dispose();
  }

  // =========================
  // UI
  // =========================
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
         // leading: Icon(Icons.menu, color: AppColors.secondaryColor),
          title: Text(
            'Real-time Data',
            style: TextStyle(
              fontSize: 25,
              color: AppColors.textColor_wihte,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: islouding
            ? Column(
                children: [
                  Gap(20),

                  // =========================
                  // MAIN BOX (LIVE STATUS)
                  // =========================
                  CustomBtm(
                    text: 'AI Monitor',
                    colorfont: AppColors.secondaryColor,
                    fontSize: 40,
                    height: 282,
                    width: 342,
                    iscolor: false,
                  ),

                  Gap(10),
                  
                  SecondCustomeText(
                    text: 'Everything happening right now:', fontSize: 17,
                  ),

                  // =========================
                  // LIST OF SESSIONS
                  // =========================
                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final item = products[index];

                        return CustomBox(
                          height: 90,
                          width: 342,
                          radius: 32,
                          text: item.name,
                          icon: item.icon,
                          iconcolor: item.color,
                          text2: item.endDt == null
                              ? '${item.startDt} To Now'
                              : '${item.startDt} To ${item.endDt}',
                         // mintxt: "${item. diff?.inMinutes ?? 0}",
                          mintxt: " ${item.minutes} ",

                          onTap: stopTimer, fontSize: 19, iscolor: true,
                        );
                      },
                    ),
                  ),
                ],
              )
            :  Center(
                child: Container(
                  
                  height: 290,
                  width: 360,
                  decoration: BoxDecoration( color: AppColors.box,borderRadius: BorderRadius.circular(22)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SecondCustomeText(
                        text: 'Wait for seconds',
                        fontSize: 30,
                      ),
                      Gap(10),
                      SizedBox(
                        height: 60, // الطول اللي إنت عايزه
                        width: 60,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.blue.withOpacity(0.2),
                          strokeCap: StrokeCap.round,
                          strokeWidth: 3.0,
                          // value: 0.7,
                          color: AppColors.grean,
                        ),
                      ),
                      Gap(30),
                       SecondCustomeText(
                        text: 'ANALYZING COGMITIVE FLOW TATE...',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                      Gap(30),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
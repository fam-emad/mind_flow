import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:study_lamp/core/app_colors.dart';
import 'package:study_lamp/pages/home/views/home2.dart';
import 'package:study_lamp/pages/state/views/state_re.dart';
import 'package:study_lamp/pages/history/history.dart';
import 'package:study_lamp/pages/current_stute/views/stute.dart';
import 'package:study_lamp/pages/current_stute/widget/stute_grean.dart'; 

 

 
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
   HomePage2 (),
    CurrentStute(),
    StateRe(),
   History (),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF0D0D0D),

      backgroundColor: AppColors.background,
      body: screens[currentIndex],

     
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        backgroundColor: Color(0xFF0F141A),
        activeColor:  AppColors.secondaryColor,
        color: Colors.grey,
       // cornerRadius: 22,

        items: [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.timer, title: "Timer"),
          TabItem(icon: Icons.bar_chart, title: "Stats"),
          TabItem(icon: Icons.history_rounded, title: "Stats")
        ],

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
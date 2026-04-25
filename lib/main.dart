import 'package:flutter/material.dart';
import 'package:study_lamp/core/network/socket_service.dart';
import 'package:study_lamp/navigetorBar.dart';
import 'package:study_lamp/pages/current_stute/views/stute.dart'; 
import 'package:study_lamp/pages/home/views/home2.dart'; 
import 'package:study_lamp/splash.dart';

void main() {
  
    WidgetsFlutterBinding.ensureInitialized();

  


  runApp(const MyApp());
    WebSocketService().connect();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
     debugShowCheckedModeBanner: false,
      home:WelcomeScreen()  ,
    );
  }
}

 

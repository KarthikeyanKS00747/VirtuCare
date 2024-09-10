import 'package:flutter/material.dart';
import 'package:virtucare/app/app.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
void main(){
  Gemini.init(apiKey: "AIzaSyBoAN_2HBbZS7XG-vPYjslz__qsIoN94Zg");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VirtuCare();
  }
}

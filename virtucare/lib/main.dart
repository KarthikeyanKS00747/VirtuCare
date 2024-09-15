import 'package:flutter/material.dart';
import 'package:virtucare/app/app.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
void main(){
  Gemini.init(apiKey: "");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VirtuCare();
  }
}

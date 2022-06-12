import 'package:console_interface/src/console/export.dart';
import 'package:console_interface/src/theme/export.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Balint Takacs - Console",
      home: const ConsolePage(),
      theme: themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}

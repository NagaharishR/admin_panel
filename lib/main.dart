import 'package:flutter/material.dart';
import 'Responsive/desktop.dart';
import 'Responsive/mobile.dart';
import 'Responsive/tablet.dart';
import 'responsive/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: ResponsiveLayout(
        mobileBody: const MobileScaffold(),
        tabletBody: const TabletScaffold(),
        desktopBody: const DesktopScaffold(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:gallery_pro/core/service_locator.dart';
import 'package:gallery_pro/presentation/screens/layout_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  LayoutScreen(),
    );
  }
}

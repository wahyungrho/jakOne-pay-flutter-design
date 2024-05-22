import 'package:flutter/material.dart';
import 'package:jakone_pay_flutter_ui/views/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JakOne Pay - Jakarta Tourist Pass',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false, fontFamily: 'Nunito'),
      home: const SplashPage(),
    );
  }
}

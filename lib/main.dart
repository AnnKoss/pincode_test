import 'package:flutter/material.dart';
import 'package:pincode_test/ui/screens/pin_screen/pin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test',
      home: PinScreen(),
    );
  }
}

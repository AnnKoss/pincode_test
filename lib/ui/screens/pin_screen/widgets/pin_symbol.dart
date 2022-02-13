import 'package:flutter/material.dart';
class PinSymbol extends StatelessWidget {
  const PinSymbol(this.isActive, {Key? key}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.green : null,
        border: isActive ? null : Border.all(color: Colors.black12),
      ),
    );
  }
}

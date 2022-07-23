import 'package:flutter/material.dart';

class InputFieldDecoration extends StatelessWidget {
  final Widget child;

  const InputFieldDecoration({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        bottom: 50,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 2.0, spreadRadius: 0.2),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: child,
      ),
    );
  }
}

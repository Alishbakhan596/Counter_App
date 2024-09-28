import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.icon,
    required this.icon1,
    required this.title,
  });
  final Widget icon;
  final Widget icon1;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80,
            width: 60,
            child: icon,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                border: Border.all(color: Colors.grey.shade300)),
          ),
          // CustomText(text: title,fontSize: 20, weight: FontWeight.bold),
          Container(
            width: 60,
            child: icon1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                border: Border.all(color: Colors.grey.shade300)),
          )
        ],
      ),
    ));
  }
}

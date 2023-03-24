import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemValueWidget extends StatelessWidget {
  String text;
  ItemValueWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4, right: 12.0, top: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 147, 169, 146).withOpacity(0.27),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(4, 4),
              blurRadius: 12.0),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}

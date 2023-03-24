import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemDataListWidget extends StatelessWidget {
  String title;
  List<Widget> children;
  ItemDataListWidget({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              color: Colors.black45,
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

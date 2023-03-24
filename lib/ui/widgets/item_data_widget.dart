import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemDataWidget extends StatelessWidget {
  String title;
  String data;
  ItemDataWidget({
    super.key,
    required this.title,
    required this.data,
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
          Text(
            data,
          ),
        ],
      ),
    );
  }
}

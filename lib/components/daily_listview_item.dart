import 'package:flutter/material.dart';

class DailyListviewItem extends StatelessWidget {
  const DailyListviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Now',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Icon(
            size: 32,
            Icons.sunny,
            color: Color(0xFFffb200),
          ),
          Text(
            '21\u00B0',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

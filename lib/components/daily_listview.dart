import 'package:flutter/material.dart';
import 'package:weather_app/components/daily_listview_item.dart';

class DailyListView extends StatelessWidget {
  const DailyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: SizedBox(
          height: 165,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFc2ced4),
                        const Color(0xFF0b5495).withOpacity(0),
                      ],
                    ),
                  ),
                  child: const DailyListviewItem(),
                );
              },
              itemCount: 6),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'loading_circle.dart';

class MonthlyReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[500]),
                    ),
                    Text('July')
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

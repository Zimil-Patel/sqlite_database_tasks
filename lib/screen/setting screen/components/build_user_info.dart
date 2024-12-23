import 'package:flutter/material.dart';

import '../../../utils.dart';

Widget buildUserInfo(IconData icon, String name, value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: defPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [

        // ICON ANS NAME
        Row(
          children: [
            Icon(icon, color: Colors.grey, size: height * 0.022,),
            const SizedBox(width: defPadding / 2,),
            Text(name, style: TextStyle(fontSize: height * 0.018, color: Colors.grey),),
          ],
        ),

        const SizedBox(
          height: defPadding / 3,
        ),

        // VALUE
        Text(value, style: TextStyle(fontSize: height * 0.018, color: Colors.white),),
      ],
    ),
  );
}
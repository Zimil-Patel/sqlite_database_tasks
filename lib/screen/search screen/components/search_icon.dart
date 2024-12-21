import 'package:flutter/material.dart';

import '../../../theme/theme_data.dart';
import '../../../utils.dart';

Container searchIcon(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(defPadding / 1.2),
    decoration: const BoxDecoration(
        color: background, shape: BoxShape.circle),
    child: Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.search,
        size: height * 0.025,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    ),
  );
}
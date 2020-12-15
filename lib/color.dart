import 'dart:math';
import 'package:flutter/material.dart';

Color color() {
  const predefinedColors = [
    Color(0xFFF5AE58),
    Color(0xFFABB868),
    Color(0xFF6C804B),
  ];
  Random random = Random();
  return predefinedColors[random.nextInt(predefinedColors.length)];
}
import 'package:flutter/material.dart';

LinearGradient getCustomGradient() {
  return new LinearGradient(
    colors: [Colors.pink, Colors.blueAccent],
    begin: const FractionalOffset(0.1, 0.6),
    end: const FractionalOffset(0.9, 0.0),
    stops: [0.0, 0.7],
    tileMode: TileMode.clamp
  );
}
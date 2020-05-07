import 'dart:math';
import 'package:vector_math/vector_math_64.dart' as Math;


 Math.Vector3 shake(double progress) {
  double offset = sin(progress * pi * 10.0);
  return Math.Vector3(offset * 4, 0.0, 0.0);
}
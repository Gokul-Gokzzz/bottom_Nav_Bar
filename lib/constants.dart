import 'package:bottombar/sample_widget.dart';
import 'package:bottombar/size_config.dart';
import 'package:flutter/material.dart';

double animatedPositionedLeftValue(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return AppSizes.blockSizeHorizontal * 5.5;
    case 1:
      return AppSizes.blockSizeHorizontal * 22.5;
    case 2:
      return AppSizes.blockSizeHorizontal * 39.5;
    case 3:
      return AppSizes.blockSizeHorizontal * 56.5;
    case 4:
      return AppSizes.blockSizeHorizontal * 73.5;
    default:
      return 0;
  }
}

final List<Color> gradent = [
  Colors.yellow.withOpacity(0.8),
  Colors.yellow.withOpacity(0.5),
  Colors.transparent
];

List<Widget> screens = [
  SampleWidget(
    label: 'Home',
    color: Colors.deepPurpleAccent,
  ),
  SampleWidget(
    label: 'Search',
    color: Colors.amber,
  ),
  SampleWidget(
    label: 'Explore',
    color: Colors.cyan,
  ),
  SampleWidget(
    label: 'Settings',
    color: Colors.deepOrangeAccent,
  ),
  SampleWidget(
    label: 'Profile',
    color: Colors.redAccent,
  ),
];

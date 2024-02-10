import 'package:firetodo/shared/firetodo_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum FireTodoPriority {
  low(1),
  medium(2),
  high(3);

  final int id;
  const FireTodoPriority(this.id);
  factory FireTodoPriority.fromId(int id) {
    return FireTodoPriority.values.firstWhere(
      (value) => value.id == id,
      orElse: () => FireTodoPriority.medium,
    );
  }

  bool get isLow => this == FireTodoPriority.low;
  bool get isMedium => this == FireTodoPriority.medium;
  bool get isHigh => this == FireTodoPriority.high;

  String get label {
    switch (this) {
      case FireTodoPriority.low:
        return 'Low';
      case FireTodoPriority.medium:
        return 'Medium';
      case FireTodoPriority.high:
        return 'High';
    }
  }

  Color get color {
    switch (this) {
      case FireTodoPriority.low:
        return FireTodoColors.mindfulPurple;
      case FireTodoPriority.medium:
        return FireTodoColors.mindfulYellow;
      case FireTodoPriority.high:
        return FireTodoColors.mindfulRed;
    }
  }

  Widget get icon {
    switch (this) {
      case FireTodoPriority.low:
        return SvgPicture.asset(
          'assets/icons/ic-priority-low.svg',
          width: 32.0,
        );
      case FireTodoPriority.medium:
        return SvgPicture.asset(
          'assets/icons/ic-priority-medium.svg',
          width: 32.0,
        );
      case FireTodoPriority.high:
        return SvgPicture.asset(
          'assets/icons/ic-priority-high.svg',
          width: 32.0,
        );
    }
  }
}

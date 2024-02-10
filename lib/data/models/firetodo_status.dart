import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum FireTodoStatus {
  incomplete(0),
  complete(1);

  final int id;
  const FireTodoStatus(this.id);
  factory FireTodoStatus.fromId(int id) {
    return FireTodoStatus.values.firstWhere(
      (value) => value.id == id,
      orElse: () => FireTodoStatus.incomplete,
    );
  }

  bool get isIncomplete => this == FireTodoStatus.incomplete;
  bool get isComplete => this == FireTodoStatus.complete;

  Widget get icon {
    switch (this) {
      case FireTodoStatus.incomplete:
        return SvgPicture.asset('assets/icons/ic-circle.svg');
      case FireTodoStatus.complete:
        return SvgPicture.asset('assets/icons/ic-circle-checked.svg');
    }
  }
}

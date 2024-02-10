import 'package:firetodo/shared/shared.dart';
import 'package:flutter/material.dart';

class FireTodoInputLabel extends StatelessWidget {
  const FireTodoInputLabel({
    super.key,
    this.isRequired = false,
    required this.label,
    required this.child,
  });

  final bool isRequired;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            children: [
              if (isRequired)
                const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: SizedBox(width: FireTodoSpacings.spacingXxs),
                ),
              if (isRequired)
                TextSpan(
                  text: '*',
                  style: FireTodoTextStyles.medium.copyWith(
                    fontSize: FireTodoSpacings.spacingMd,
                    color: FireTodoColors.mindfulRed,
                  ),
                ),
            ],
          ),
          style: FireTodoTextStyles.medium.copyWith(
            fontSize: FireTodoSpacings.spacingMd,
          ),
        ),
        const SizedBox(height: FireTodoSpacings.spacingXxs),
        child,
      ],
    );
  }
}

import 'package:firetodo/data/data.dart';
import 'package:firetodo/shared/shared.dart';
import 'package:flutter/material.dart';

class FireTodoCard extends StatelessWidget {
  const FireTodoCard({
    super.key,
    this.onTap,
    required this.title,
    required this.priority,
    required this.status,
    required this.onComplete,
  });

  final VoidCallback? onTap;
  final String title;
  final FireTodoPriority priority;
  final FireTodoStatus status;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: FireTodoSpacings.spacingMd,
          vertical: FireTodoSpacings.spacingXs,
        ),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: const StadiumBorder(),
          shadows: [
            BoxShadow(
              color: FireTodoColors.mindfulBrown.withOpacity(0.05),
              offset: const Offset(0, 8),
              blurRadius: 16,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            priority.icon,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: FireTodoSpacings.spacingMd,
                ),
                child: Text(
                  title,
                  style: FireTodoTextStyles.semiBold.copyWith(
                    fontSize: FireTodoSpacings.spacingMd,
                    color: status.isComplete
                        ? FireTodoColors.grayRockDarker
                        : FireTodoColors.mindfulBrown,
                    decoration: status.isComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: onComplete,
              icon: status.icon,
            ),
          ],
        ),
      ),
    );
  }
}

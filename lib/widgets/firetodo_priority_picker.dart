import 'package:firetodo/data/data.dart';
import 'package:firetodo/shared/shared.dart';
import 'package:flutter/material.dart';

class FireTodoPriorityPicker extends StatelessWidget {
  const FireTodoPriorityPicker({
    super.key,
    required this.selectedPriority,
    required this.onSelected,
  });

  final FireTodoPriority selectedPriority;
  final Function(FireTodoPriority priority) onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: FireTodoSpacings.spacingMd,
        children: FireTodoPriority.values.map(
          (priority) {
            final isSelected = selectedPriority == priority;
            return ChoiceChip(
              avatar: priority.icon,
              label: Text(priority.label),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) onSelected(priority);
              },
              shape: const StadiumBorder(),
              selectedColor: priority.color.withOpacity(0.1),
              backgroundColor: Colors.white,
              side: isSelected
                  ? BorderSide(color: priority.color)
                  : BorderSide.none,
              showCheckmark: false,
              elevation: 0.0,
            );
          },
        ).toList(),
      ),
    );
  }
}

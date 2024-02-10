import 'package:firetodo/data/data.dart';
import 'package:firetodo/shared/shared.dart';
import 'package:firetodo/widgets/firetodo_input_label.dart';
import 'package:firetodo/widgets/firetodo_priority_picker.dart';
import 'package:firetodo/widgets/firetodo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FireTodoNewBottomSheet extends StatefulWidget {
  const FireTodoNewBottomSheet({super.key});

  @override
  State<FireTodoNewBottomSheet> createState() => _FireTodoNewBottomSheetState();
}

class _FireTodoNewBottomSheetState extends State<FireTodoNewBottomSheet> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var selectedPriority = FireTodoPriority.low;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: FireTodoSpacings.spacingXlg * 2,
          height: FireTodoSpacings.spacingXxs,
          margin: const EdgeInsets.only(top: FireTodoSpacings.spacingXs),
          decoration: const ShapeDecoration(
            color: FireTodoColors.grayRock,
            shape: StadiumBorder(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Task',
                style: FireTodoTextStyles.semiBold.copyWith(
                  fontSize: FireTodoSpacings.spacingLg,
                ),
              ),
              ClipOval(
                child: Material(
                  color: FireTodoColors.grayRock,
                  child: InkWell(
                    splashColor: FireTodoColors.grayRockDarker.withOpacity(0.1),
                    onTap: () => Navigator.of(context).pop(),
                    child: const SizedBox(
                      width: FireTodoSpacings.spacingLg * 1.8,
                      height: FireTodoSpacings.spacingLg * 1.8,
                      child: Icon(
                        Icons.close,
                        color: FireTodoColors.grayRockDarker,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const Divider(color: FireTodoColors.grayRock, height: 0.0),
        SafeArea(
          child: Container(
            padding: const EdgeInsets.all(FireTodoSpacings.spacingMd),
            child: Column(
              children: [
                // TODO: 1. Implement input todolist task title
                FireTodoInputLabel(
                  isRequired: true,
                  label: 'Task Title',
                  child: FireTodoTextField(
                    controller: titleController,
                    hint: 'What will I do...',
                  ),
                ),
                const SizedBox(height: FireTodoSpacings.spacingMd),
                // TODO: 2. Implement input todolist task priority
                FireTodoInputLabel(
                  isRequired: true,
                  label: 'Priority',
                  child: FireTodoPriorityPicker(
                    selectedPriority: selectedPriority,
                    onSelected: (priority) {
                      setState(() => selectedPriority = priority);
                    },
                  ),
                ),
                const SizedBox(height: FireTodoSpacings.spacingMd),
                // TODO: 3. Implement input todolist task description
                FireTodoInputLabel(
                  label: 'Task Description',
                  child: FireTodoTextField(
                    controller: titleController,
                    isMultiline: true,
                  ),
                ),
                const SizedBox(height: FireTodoSpacings.spacingXlg),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: FireTodoColors.mindfulBrown,
                      padding: const EdgeInsets.all(FireTodoSpacings.spacingMd),
                      textStyle: FireTodoTextStyles.semiBold.copyWith(
                        fontSize: FireTodoSpacings.spacingLg,
                        color: Colors.white,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Save'),
                        const SizedBox(width: FireTodoSpacings.spacingXs),
                        SvgPicture.asset(
                          'assets/icons/ic-arrow-right.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

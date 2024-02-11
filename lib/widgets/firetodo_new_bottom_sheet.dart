import 'package:firetodo/data/data.dart';
import 'package:firetodo/providers/providers.dart';
import 'package:firetodo/shared/shared.dart';
import 'package:firetodo/widgets/firetodo_input_label.dart';
import 'package:firetodo/widgets/firetodo_priority_picker.dart';
import 'package:firetodo/widgets/firetodo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class FireTodoNewBottomSheet extends StatefulWidget {
  const FireTodoNewBottomSheet({
    super.key,
    required this.date,
    this.todoItem,
  });

  final DateTime date;
  final FireTodoItem? todoItem;

  @override
  State<FireTodoNewBottomSheet> createState() => _FireTodoNewBottomSheetState();
}

class _FireTodoNewBottomSheetState extends State<FireTodoNewBottomSheet> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var selectedPriority = FireTodoPriority.low;

  @override
  void initState() {
    loadTodo();
    super.initState();
  }

  void loadTodo() {
    if (widget.todoItem != null) {
      final todoItem = widget.todoItem!;
      titleController.text = todoItem.title;
      descriptionController.text = todoItem.description;
      selectedPriority = todoItem.priority;
    }
  }

  void addTodo() {
    Provider.of<FireTodoListNotifier>(
      context,
      listen: false,
    ).addUpdateTodo(
      FireTodoItem(
        id: const Uuid().v4(),
        title: titleController.text,
        priority: selectedPriority,
        status: FireTodoStatus.incomplete,
        description: descriptionController.text,
        date: widget.date,
      ),
    );
  }

  void updateTodo() {
    if (widget.todoItem != null) {
      final todoItem = widget.todoItem!;
      Provider.of<FireTodoListNotifier>(
        context,
        listen: false,
      ).addUpdateTodo(
        FireTodoItem(
          id: todoItem.id,
          title: titleController.text,
          priority: selectedPriority,
          status: FireTodoStatus.incomplete,
          description: descriptionController.text,
          date: todoItem.date,
        ),
      );
    }
  }

  void deleteTodo() {
    if (widget.todoItem != null) {
      final todoItem = widget.todoItem!;
      Provider.of<FireTodoListNotifier>(
        context,
        listen: false,
      ).deleteTodo(todoItem);
    }
  }

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
                widget.todoItem == null ? 'New Task' : 'Edit Task',
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
                FireTodoInputLabel(
                  isRequired: true,
                  label: 'Task Title',
                  child: FireTodoTextField(
                    controller: titleController,
                    hint: 'What will I do...',
                  ),
                ),
                const SizedBox(height: FireTodoSpacings.spacingMd),
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
                FireTodoInputLabel(
                  label: 'Task Description',
                  child: FireTodoTextField(
                    controller: descriptionController,
                    isMultiline: true,
                  ),
                ),
                const SizedBox(height: FireTodoSpacings.spacingXlg),
                Consumer<FireTodoListNotifier>(
                  builder: (context, data, child) {
                    return Row(
                      children: [
                        if (widget.todoItem != null)
                          IconButton(
                            onPressed: () {
                              deleteTodo();
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.delete_outline),
                          ),
                        if (widget.todoItem != null)
                          const SizedBox(width: FireTodoSpacings.spacingMd),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (widget.todoItem != null) {
                                updateTodo();
                              } else {
                                addTodo();
                              }

                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: FireTodoColors.mindfulBrown,
                              padding: const EdgeInsets.all(
                                FireTodoSpacings.spacingMd,
                              ),
                              textStyle: FireTodoTextStyles.semiBold.copyWith(
                                fontSize: FireTodoSpacings.spacingLg,
                                color: Colors.white,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Save'),
                                const SizedBox(
                                  width: FireTodoSpacings.spacingXs,
                                ),
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

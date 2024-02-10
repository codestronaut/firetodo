import 'package:flutter/material.dart';

import '../shared/shared.dart';

class FireTodoTextField extends StatelessWidget {
  const FireTodoTextField({
    super.key,
    this.controller,
    this.hint,
    this.isMultiline = false,
  });

  final TextEditingController? controller;
  final String? hint;
  final bool isMultiline;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isMultiline ? TextInputType.multiline : null,
      textInputAction: isMultiline ? TextInputAction.newline : null,
      maxLines: isMultiline ? 4 : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint ?? 'Type here...',
        hintStyle: FireTodoTextStyles.regular.copyWith(
          color: FireTodoColors.grayRockDarker,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: FireTodoSpacings.spacingXlg,
          vertical: FireTodoSpacings.spacingMd,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: FireTodoColors.grayRock),
          borderRadius: BorderRadius.circular(
            isMultiline ? FireTodoSpacings.spacingXlg : 48.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: FireTodoColors.mindfulGreen),
          borderRadius: BorderRadius.circular(
            isMultiline ? FireTodoSpacings.spacingXlg : 48.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: FireTodoColors.grayRock),
          borderRadius: BorderRadius.circular(
            isMultiline ? FireTodoSpacings.spacingXlg : 48.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: FireTodoColors.mindfulRed),
          borderRadius: BorderRadius.circular(
            isMultiline ? FireTodoSpacings.spacingXlg : 48.0,
          ),
        ),
      ),
    );
  }
}

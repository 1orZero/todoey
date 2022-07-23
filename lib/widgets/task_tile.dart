import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final VoidCallback checkboxCallback;

  // ignore: use_key_in_widget_constructors
  const TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckBox(
        isChecked: isChecked,
        toggleCheckboxState: checkboxCallback,
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  const TaskCheckBox({
    Key? key,
    required this.isChecked,
    required this.toggleCheckboxState,
  }) : super(key: key);
  final bool isChecked;
  final VoidCallback toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isChecked,
        onChanged: ((value) {
          toggleCheckboxState();
        }));
  }
}

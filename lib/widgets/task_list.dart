import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/main.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: ((context, taskData, child) => ListView.builder(
          itemBuilder: ((context, index) => TaskTile(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkboxCallback: () {
                  setState(() {
                    taskData.tasks[index].toggleDone();
                  });
                },
              )),
          itemCount: taskData.taskCount)),
    );
  }
}

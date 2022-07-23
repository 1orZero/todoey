import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}

class TaskData with ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread')
  ];

  int get taskCount {
    return tasks.length;
  }

  void addTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}

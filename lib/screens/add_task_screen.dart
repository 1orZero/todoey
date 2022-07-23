import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/main.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            TextField(
              onChanged: (value) {
                newTaskTitle = value;
                print(newTaskTitle);
              },
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter your task',
              ),
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent)),
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}

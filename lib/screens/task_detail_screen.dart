import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_getx/controller/task_controller.dart';
import '../controllers/task_controller.dart';
import '../models/task.dart';

class TaskDetailScreen extends StatelessWidget {
  final TaskController taskController = Get.find();

  @override
  Widget build(BuildContext context) {
    final String taskId = Get.arguments;
    final task = taskController.getTaskById(taskId);

    if (task == null) {
      return Scaffold(
        body: Center(child: Text('Task not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${task.title}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Description: ${task.description}',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          taskController.removeTask(taskId);
          Get.back();
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}

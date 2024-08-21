import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_getx/controller/task_controller.dart';
import '../controllers/task_controller.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Obx(() {
        if (taskController.tasks.isEmpty) {
          return Center(child: Text('No tasks available'));
        }
        return ListView.builder(
          itemCount: taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              onTap: () {
                Get.toNamed(AppRoutes.taskDetail, arguments: task.id);
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addTask);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

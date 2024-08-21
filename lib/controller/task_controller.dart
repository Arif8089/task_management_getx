import 'package:get/get.dart';
import '../models/task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(String id) {
    tasks.removeWhere((task) => task.id == id);
  }

  Task? getTaskById(String id) {
    return tasks.firstWhereOrNull((task) => task.id == id);
  }
}

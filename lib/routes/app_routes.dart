import 'package:get/get.dart';
import '../screens/home_screen.dart';
import '../screens/task_detail_screen.dart';

class AppRoutes {
  static const home = '/';
  static const taskDetail = '/taskDetail';
  static const addTask = '/addTask'; // Placeholder for now
}

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.taskDetail, page: () => TaskDetailScreen()),
  ];
}

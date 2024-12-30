import 'package:taskmanagement/data/models/task.dart';

abstract class TaskRepositories {
  Future<void> createTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(Task task);
  Future<List<Task>> getAllTasks();
}

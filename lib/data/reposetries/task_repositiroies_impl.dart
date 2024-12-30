import 'package:taskmanagement/data/data.dart';
import 'package:taskmanagement/data/models/task.dart';
import 'package:taskmanagement/data/reposetries/task_repositories.dart';

class TaskRepositiroiesImpl implements TaskRepositories {
  TaskRepositiroiesImpl(this._datasources);
  final TaskDatasources _datasources;
  @override
  Future<void> createTask(Task task) async {
    try {
      await _datasources.addTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    try {
      await _datasources.deletTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Task>> getAllTasks() async {
    try {
      return await _datasources.getAllTasks();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    try {
      await _datasources.updateTask(task);
    } catch (e) {
      throw '$e';
    }
  }
}

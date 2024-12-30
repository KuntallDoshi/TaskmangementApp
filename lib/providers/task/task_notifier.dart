import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/data/models/task.dart';
import 'package:taskmanagement/data/reposetries/task_repositories.dart';
import 'package:taskmanagement/providers/task/task_state.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepositories _repository;
  TaskNotifier(this._repository) : super(const TaskState.inital()) {
    getTasks();
  }

  Future<void> createTask(Task task) async {
    try {
      await _repository.createTask(task);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final isCompleted = !task.isCompleted;
      final updateTask = task.copyWith(isCompleted: isCompleted);
      await _repository.updateTask(updateTask);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _repository.deleteTask(task);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getTasks() async {
    try {
      final tasks = await _repository.getAllTasks();
      state = state.copywith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

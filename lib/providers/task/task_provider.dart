import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/data/data.dart';
import 'package:taskmanagement/providers/task/task.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>(
  (ref) {
    final repository = ref.watch(taskRepositioryProvider);
    return TaskNotifier(repository);
  },
);

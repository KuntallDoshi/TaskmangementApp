import 'package:equatable/equatable.dart';
import 'package:taskmanagement/data/models/task.dart';

class TaskState extends Equatable {
  final List<Task> tasks;

  const TaskState(this.tasks);
  const TaskState.inital({
    this.tasks = const [],
  });

  TaskState copywith({
    List<Task>? tasks,
  }) {
    return TaskState(tasks ?? this.tasks);
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}

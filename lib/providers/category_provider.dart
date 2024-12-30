import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/utils/task_category.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategory>((ref) {
  return TaskCategory.others;
});

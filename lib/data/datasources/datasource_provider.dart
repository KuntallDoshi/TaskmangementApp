import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/data/data.dart';

final taskDatasourceProvider = Provider<TaskDatasources>((ref) {
  return TaskDatasources();
});

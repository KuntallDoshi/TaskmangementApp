import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/data/data.dart';

final taskRepositioryProvider = Provider<TaskRepositories>((ref) {
  final datasource = ref.watch(taskDatasourceProvider);
  return TaskRepositiroiesImpl(datasource);
});

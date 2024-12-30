import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/data/models/task.dart';
import 'package:taskmanagement/providers/task/task.dart';
import 'package:taskmanagement/utils/app_alerts.dart';
import 'package:taskmanagement/utils/extension.dart';
import 'package:taskmanagement/widgets/common_container.dart';
import 'package:taskmanagement/widgets/task_detail.dart';
import 'package:taskmanagement/widgets/widgets.dart';

class DisplayListTasks extends ConsumerWidget {
  const DisplayListTasks(
      {super.key, required this.tasks, this.isCompletedTasks = false});
  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage = isCompletedTasks
        ? 'There is no complete task yet'
        : 'There is no task to do';
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksMessage,
                style: context.texttheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    AppAlerts.showDeleteAlertDialog(context, ref, task);
                  },
                  onTap: () async {
                    //Show Task Details
                    await showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return TaskDetail(task: task);
                      },
                    );
                  },
                  child: TaskTiles(
                    task: task,
                    onComplete: (value) async {
                      await ref
                          .read(taskProvider.notifier)
                          .updateTask(task)
                          .then(
                        (value) {
                          AppAlerts.displaySnackBar(
                              context,
                              task.isCompleted
                                  ? 'Task incompleted'
                                  : 'task Completed');
                        },
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1,
                );
              },
            ),
    );
  }
}

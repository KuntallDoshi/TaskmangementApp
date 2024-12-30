import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskmanagement/data/models/task.dart';
import 'package:taskmanagement/utils/extension.dart';
import 'package:taskmanagement/widgets/widgets.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.texttheme;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: Column(
        children: [
          const Gap(16),
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          const Gap(16),
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            task.time,
            style: style.titleMedium,
          ),
          const Gap(16),
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Task to be completed on ${task.date}"),
                Icon(
                  Icons.check_box_rounded,
                  color: task.category.color,
                )
              ],
            ),
          ),
          const Gap(16),
          SizedBox(
            width: 350,
            child: Divider(
              thickness: 1.5,
              color: task.category.color,
            ),
          ),
          const Gap(16),
          Text(
            task.note.isEmpty
                ? 'There is no additional note for this task'
                : task.note,
          ),
          const Gap(16),
          Visibility(
            visible: task.isCompleted,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Task Completed"),
                Icon(
                  Icons.check_box_rounded,
                  color: Colors.green,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

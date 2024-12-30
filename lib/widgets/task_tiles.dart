import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskmanagement/data/models/task.dart';
import 'package:taskmanagement/utils/extension.dart';
import 'package:taskmanagement/widgets/widgets.dart';

class TaskTiles extends StatelessWidget {
  const TaskTiles({super.key, required this.task, this.onComplete});
  final Task task;
  final Function(bool?)? onComplete;

  @override
  Widget build(BuildContext context) {
    final style = context.texttheme;
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(backgroundOpacity),
            child: Center(
                child: Icon(
              task.category.icon,
              color: task.category.color.withOpacity(iconOpacity),
            )),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: style.titleMedium?.copyWith(
                      decoration: textDecoration,
                      fontSize: 20,
                      fontWeight: fontWeight),
                ),
                Text(task.time,
                    style: style.titleMedium
                        ?.copyWith(decoration: textDecoration)),
              ],
            ),
          ),
          Checkbox(
            value: task.isCompleted,
            onChanged: onComplete,
          )
        ],
      ),
    );
  }
}

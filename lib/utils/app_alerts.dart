import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanagement/data/models/task.dart';
import 'package:taskmanagement/providers/task/task.dart';
import 'package:taskmanagement/utils/extension.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.texttheme.bodyLarge?.copyWith(color: Colors.white),
        ),
        backgroundColor: context.colorScheme.primary,
      ),
    );
  }

  static Future<void> showDeleteAlertDialog(
      BuildContext context, WidgetRef ref, Task task) async {
    Widget cancelButton = TextButton(
      onPressed: () => context.pop(context),
      child: Text("NO"),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(taskProvider.notifier).deleteTask(task).then(
          (value) {
            AppAlerts.displaySnackBar(context, 'Task delete successfully');
            context.pop();
          },
        );
      },
      child: Text("YES"),
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Are You sure to delete this task?"),
      actions: [
        deleteButton,
        cancelButton,
      ],
    );
    await showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:taskmanagement/config/router/routes.dart';
import 'package:taskmanagement/data/data.dart';
import 'package:taskmanagement/providers/providers.dart';
import 'package:taskmanagement/providers/task/task.dart';
import 'package:taskmanagement/utils/extension.dart';
import 'package:taskmanagement/utils/utils.dart';
import 'package:taskmanagement/widgets/display_white_text.dart';
import 'package:taskmanagement/widgets/widgets.dart';

class HomeScreens extends ConsumerWidget {
  static HomeScreens builder(BuildContext context, GoRouterState state) =>
      const HomeScreens();
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    final completyedTasks = _compeltedTasks(taskState.tasks, ref);
    final incompletedTasks = _incompletedTasks(taskState.tasks, ref);
    final selectDate = ref.watch(dateProvider);
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: deviceSize.height * 0.3,
              width: deviceSize.width,
              color: colors.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Helpers.selecDate(context, ref);
                    },
                    child: DisplayWhiteText(
                      text: DateFormat.yMMMMd().format(selectDate),
                      fontSize: 20,
                    ),
                  ),
                  const Gap(10),
                  const DisplayWhiteText(
                    text: "Manage Your Task Here",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 130,
          left: 0,
          right: 0,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  DisplayListTasks(
                    tasks: incompletedTasks,
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Completed",
                        style: context.texttheme.headlineMedium,
                      ),
                    ],
                  ),
                  const Gap(20),
                  DisplayListTasks(
                    tasks: completyedTasks,
                    isCompletedTasks: true,
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      context.push(RouteLocation.crateTask);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: deviceSize.width,
                      height: deviceSize.height * 0.050,
                      decoration: BoxDecoration(
                        color: Colors.purple[900],
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        "Add New Task",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  List<Task> _compeltedTasks(List<Task> tasks, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Task> filteredTasks = [];
    for (var task in tasks) {
      if (task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
        if (task.isCompleted && isTaskDay) {
          filteredTasks.add(task);
        }
      }
    }
    return filteredTasks;
  }

  List<Task> _incompletedTasks(List<Task> tasks, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);

    final List<Task> filteredTasks = [];

    for (var task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);

      if (!task.isCompleted && isTaskDay) {
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:taskmanagement/providers/providers.dart';
import 'package:taskmanagement/utils/extension.dart';
import 'package:taskmanagement/utils/task_category.dart';
import 'package:taskmanagement/widgets/circle_container.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategory.values.toList();
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Categories',
            style: context.texttheme.titleLarge,
          ),
          const Gap(10),
          Expanded(
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final catagory = categories[index];

                    return InkWell(
                        onTap: () => ref.read(categoryProvider.notifier).state =
                            catagory,
                        borderRadius: BorderRadius.circular(30),
                        child: CircleContainer(
                          color: catagory.color.withOpacity(0.3),
                          child: Icon(
                            catagory.icon,
                            color: catagory == selectedCategory
                                ? context.colorScheme.primary
                                : catagory.color,
                          ),
                        ));
                  },
                  separatorBuilder: (context, index) => const Gap(10),
                  itemCount: categories.length))
        ],
      ),
    );
  }
}

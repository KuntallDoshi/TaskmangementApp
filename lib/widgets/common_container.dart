import 'package:flutter/material.dart';
import 'package:taskmanagement/utils/extension.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key, this.child, this.height});
  final Widget? child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return Container(
        width: deviceSize.width,
        height: deviceSize.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.colorScheme.primaryContainer,
        ),
        child: child);
  }
}

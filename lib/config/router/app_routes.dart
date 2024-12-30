import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanagement/config/router/route_location.dart';
import 'package:taskmanagement/screens/create_task.dart';
import 'package:taskmanagement/screens/home_screens.dart';

final navigateKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigateKey,
    builder: HomeScreens.builder,
  ),
  GoRoute(
    path: RouteLocation.crateTask,
    parentNavigatorKey: navigateKey,
    builder: CreateTask.builder,
  ),
];

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/config/router/routes.dart';

final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      routes: appRoutes,
      initialLocation: RouteLocation.home,
      navigatorKey: navigateKey);
});

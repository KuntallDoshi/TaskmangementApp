import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'date_provider.dart';
export 'time_provider.dart';
export 'category_provider.dart';

final dateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

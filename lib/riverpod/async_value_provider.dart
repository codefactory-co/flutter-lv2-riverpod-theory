import 'package:flutter_riverpod/flutter_riverpod.dart';

final customAsyncValueProvider = StateNotifierProvider<AsyncValueNotifier, AsyncValue<List<int>>>(
  (ref) {
    return AsyncValueNotifier();
  },
);

class AsyncValueNotifier extends StateNotifier<AsyncValue<List<int>>> {
  AsyncValueNotifier() : super(const AsyncValue.loading()) {
    fetchData();
  }

  void fetchData() async {
    state = const AsyncValue.loading();

    try {
      await Future.delayed(Duration(seconds: 1));

      state = AsyncValue.data(List.generate(10, (index) => index * 2));
    } catch (e, stack) {
      state = AsyncValue.error(e, stackTrace: stack);
    }
  }

  void fetchDataGuard() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await Future.delayed(Duration(seconds: 1));

      return List.generate(10, (index) => index * 2);
    });
  }
}

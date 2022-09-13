import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/riverpod/provider_observer.dart';
import 'package:riverpod_theory/screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}

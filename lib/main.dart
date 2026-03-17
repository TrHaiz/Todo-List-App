
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'homepage.dart';
import'themeProvider.dart';
void main() {
  runApp(
    ProviderScope(child: const MyApp()));
}
class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme=ref.watch(themeNotifierProvider);
    return 
       MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: currentTheme,
        home: MyHomePage()
      );
  }
}


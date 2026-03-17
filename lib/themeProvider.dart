import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends Notifier<ThemeMode>{
  @override
  ThemeMode build() {
    LoadTheme();
    return ThemeMode.light;
  }
  
  Future<void>ToggleTheme() async{
    final prefs=await SharedPreferences.getInstance();
    final isLight=state==ThemeMode.light;
     state=isLight? ThemeMode.dark : ThemeMode.light;
    await prefs.setBool('_themeKey', isLight);
  }

  Future<void>LoadTheme() async {
    final prefs=await SharedPreferences.getInstance();
    final isDark=prefs.getBool('_themeKey') ?? false;
    state=isDark ? ThemeMode.dark : ThemeMode.light;
  }


  }
      final themeNotifierProvider=NotifierProvider<ThemeNotifier, ThemeMode>((){return ThemeNotifier();});
  
// Copyright © 2020 Birju Vachhani. All rights reserved.
// Use of this source code is governed by an Apache license that can be
// found in the LICENSE file.

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mehome/ui/home/bottom_navi.dart';
import 'package:mehome/ui/home/dashboard.dart';
import 'package:mehome/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        // primaryColor: AppColors().colorPrimary,
        primaryColorDark: AppColors().colorSecondary,
        colorSchemeSeed: AppColors().colorSecondary,

      ),

      // dark: ThemeData(
      //   useMaterial3: true,
      //   brightness: Brightness.dark,
      //   // primaryColor: AppColors().colorPrimary,
      //   primaryColorDark: AppColors().colorSecondary,
      //   colorSchemeSeed: AppColors().colorSecondary,
      // ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, lightTheme) => MaterialApp(
        title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: lightTheme,
        home: const BottomNav(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Theme Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This is a sample app to demonstrate the usage of adaptive theme.',
            ),
            const Text(
              'You can switch between light and dark theme using the switch below.',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Light'),
                const SizedBox(width: 10),
                Switch(
                  value: AdaptiveTheme.of(context).mode.isDark,
                  onChanged: (value) {
                    if (value) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                  },
                ),
                const SizedBox(width: 10),
                const Text('Dark'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:clock_app/models/theme_provider.dart';
import 'package:clock_app/screen/splash_screen.dart';
import 'package:clock_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clock App',
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          themeMode: theme.isLight ? ThemeMode.light : ThemeMode.dark,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'pages/splash_page.dart';
import 'utils/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void changeTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void changeLanguage(Locale locale) {
      context.setLocale(locale);
  }
  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Luma',

      themeMode: _themeMode,

      theme: AppTheme.light(isArabic: isArabic),
      darkTheme: AppTheme.dark(isArabic: isArabic),

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      home: SplashPage(
        onThemeChanged: changeTheme,
        isDark: _themeMode == ThemeMode.dark,
        onLanguageChanged: changeLanguage,
      ),
    );
  }
}
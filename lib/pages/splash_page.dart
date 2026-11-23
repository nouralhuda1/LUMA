
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    required this.onThemeChanged,
    required this.isDark,
    required this.onLanguageChanged,
  });

  final Function(bool) onThemeChanged;
  final bool isDark;
  final Function(Locale) onLanguageChanged;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 2500), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => OnboardingPage(
            onThemeChanged: widget.onThemeChanged,
            isDark: widget.isDark,
            onLanguageChanged: widget.onLanguageChanged,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_rounded,
              size: 100,
              color: colors.primary,
            ),

            const SizedBox(height: 20),

            Text(
              'app_name'.tr(),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colors.onSurface,
                  ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

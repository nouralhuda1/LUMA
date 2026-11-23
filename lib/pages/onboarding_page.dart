
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.onThemeChanged,
    required this.isDark,
    required this.onLanguageChanged,
  });

  final Function(bool) onThemeChanged;
  final bool isDark;
  final Function(Locale) onLanguageChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isArabic = context.locale.languageCode == 'ar';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    tooltip: isDark ? 'Light mode' : 'Dark mode',
                    onPressed: () {
                      onThemeChanged(!isDark);
                    },
                    icon: Icon(
                      isDark ? Icons.light_mode : Icons.dark_mode,
                      color: colors.primary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      onLanguageChanged(
                        isArabic
                            ? const Locale('en', 'US')
                            : const Locale('ar', 'SA'),
                      );
                    },
                    child: Text(
                      isArabic ? 'English' : 'العربية',
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: IntroductionScreen(
                pages: [
                  PageViewModel(
                    title: 'onboarding_title_1'.tr(),
                    body: 'onboarding_body_1'.tr(),
                    image: Icon(
                      Icons.shopping_bag_outlined,
                      size: 130,
                      color: colors.primary,
                    ),
                  ),
                  PageViewModel(
                    title: 'onboarding_title_2'.tr(),
                    body: 'onboarding_body_2'.tr(),
                    image: Icon(
                      Icons.favorite_border,
                      size: 130,
                      color: colors.primary,
                    ),
                  ),
                  PageViewModel(
                    title: 'onboarding_title_3'.tr(),
                    body: 'onboarding_body_3'.tr(),
                    image: Icon(
                      Icons.local_shipping_outlined,
                      size: 130,
                      color: colors.primary,
                    ),
                  ),
                ],
                showSkipButton: true,
                skip: Text('skip'.tr()),
                next: Icon(
                  isArabic ? Icons.arrow_back : Icons.arrow_forward,
                  color: colors.primary,
                ),
                done: Text(
                  'done'.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colors.primary,
                  ),
                ),
                onDone: () => goToLogin(context),
                onSkip: () => goToLogin(context),
                dotsDecorator: DotsDecorator(
                  activeColor: colors.primary,
                  color: colors.secondary,
                  size: const Size(8, 8),
                  activeSize: const Size(20, 8),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => LoginPage(
          onThemeChanged: onThemeChanged,
          isDark: isDark,
          onLanguageChanged: onLanguageChanged,
        ),
      ),
    );
  }
}

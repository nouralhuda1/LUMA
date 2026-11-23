
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
                    image: onboardingImage(
                      'assets/images/onboarding/discover.jpg',
                      colors,
                    ),
                  ),
                  PageViewModel(
                    title: 'onboarding_title_2'.tr(),
                    body: 'onboarding_body_2'.tr(),
                    image: onboardingImage(
                      'assets/images/onboarding/favorites.jpg',
                      colors,
                    ),
                  ),
                  PageViewModel(
                    title: 'onboarding_title_3'.tr(),
                    body: 'onboarding_body_3'.tr(),
                    image: onboardingImage(
                      'assets/images/onboarding/delivery.jpg',
                      colors,
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

  Widget onboardingImage(String imagePath, ColorScheme colors) {
    return Container(
      width: 230,
      height: 230,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.secondary.withValues(alpha: 0.35),
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          width: 214,
          height: 214,
          fit: BoxFit.cover,
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

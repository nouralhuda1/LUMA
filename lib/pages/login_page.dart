
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'signup_page.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.shopping_bag_rounded,
                    size: 75,
                    color: colors.primary,
                  ),

                  const SizedBox(height: 25),

                  Text(
                    'welcome'.tr(),
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'login_subtitle'.tr(),
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.65),
                    ),
                  ),

                  const SizedBox(height: 35),

                  CustomTextField(
                    hint: 'email'.tr(),
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 16),

                  CustomTextField(
                    hint: 'password'.tr(),
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),

                  const SizedBox(height: 25),

                  CustomButton(
                    text: 'login'.tr(),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomePage(
                            onThemeChanged: onThemeChanged,
                            isDark: isDark,
                            onLanguageChanged: onLanguageChanged,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 18),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SignupPage(
                            onThemeChanged: onThemeChanged,
                            isDark: isDark,
                            onLanguageChanged: onLanguageChanged,
                          ),
                        ),
                      );
                    },
                    child: Text('no_account'.tr()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

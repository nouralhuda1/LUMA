
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'home_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({
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
      appBar: AppBar(
        title: Text('create_account'.tr()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 25),

                Text(
                  'join_store'.tr(),
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colors.onSurface,
                  ),
                ),

                const SizedBox(height: 30),

                CustomTextField(
                  hint: 'full_name'.tr(),
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 16),

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
                  text: 'create_account'.tr(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

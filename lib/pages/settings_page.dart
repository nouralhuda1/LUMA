
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
    required this.onThemeChanged,
    required this.isDark,
    required this.onLanguageChanged,
  });

  final Function(bool) onThemeChanged;
  final bool isDark;
  final Function(Locale) onLanguageChanged;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool darkMode;

  @override
  void initState() {
    super.initState();
    darkMode = widget.isDark;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isArabic = context.locale.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr()),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('dark_mode'.tr()),
            secondary: Icon(
              Icons.dark_mode_outlined,
              color: colors.primary,
            ),
            value: darkMode,
            activeTrackColor: colors.secondary,
            activeThumbColor: colors.primary,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });

              widget.onThemeChanged(value);
            },
          ),

          Divider(color: colors.outlineVariant),

          ListTile(
            leading: Icon(
              Icons.language,
              color: colors.primary,
            ),
            title: Text('language'.tr()),
            subtitle: Text(
              isArabic ? 'العربية' : 'English',
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.translate,
              color: colors.primary,
            ),
            title: const Text('English'),
            trailing: isArabic
                ? null
                : Icon(
                    Icons.check_circle,
                    color: colors.primary,
                  ),
            onTap: () {
              context.setLocale(const Locale('en', 'US'));
              widget.onLanguageChanged(const Locale('en', 'US'));
              setState(() {});
            },
          ),

          ListTile(
            leading: Icon(
              Icons.translate,
              color: colors.primary,
            ),
            title: const Text('العربية'),
            trailing: isArabic
                ? Icon(
                    Icons.check_circle,
                    color: colors.primary,
                  )
                : null,
            onTap: () {
              context.setLocale(const Locale('ar', 'SA'));
              widget.onLanguageChanged(const Locale('ar', 'SA'));
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

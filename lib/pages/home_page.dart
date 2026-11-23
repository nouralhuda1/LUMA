
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/product_card.dart';
import 'product_details_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.onThemeChanged,
    required this.isDark,
    required this.onLanguageChanged,
  });

  final Function(bool) onThemeChanged;
  final bool isDark;
  final Function(Locale) onLanguageChanged;

  static const List<Map<String, dynamic>> products = [
    {
      'nameKey': 'product_watch',
      'price': '\$45.00',
      'descriptionKey': 'product_watch_desc',
      'icon': Icons.watch,
    },
    {
      'nameKey': 'product_headphones',
      'price': '\$60.00',
      'descriptionKey': 'product_headphones_desc',
      'icon': Icons.headphones,
    },
    {
      'nameKey': 'product_handbag',
      'price': '\$35.00',
      'descriptionKey': 'product_handbag_desc',
      'icon': Icons.shopping_bag,
    },
    {
      'nameKey': 'product_sneakers',
      'price': '\$75.00',
      'descriptionKey': 'product_sneakers_desc',
      'icon': Icons.directions_run,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Luma',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'settings'.tr(),
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingsPage(
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

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'discover_products'.tr(),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                    ),
              ),

              const SizedBox(height: 6),

              Text(
                'discover_subtitle'.tr(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.65),
                    ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductCard(
                      name: (product['nameKey'] as String).tr(),
                      price: product['price'] as String,
                      icon: product['icon'] as IconData,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailsPage(
                              product: product,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

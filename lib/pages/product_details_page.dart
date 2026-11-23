
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('product_details'.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: colors.secondary.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: colors.outlineVariant,
                ),
              ),
              child: Icon(
                product['icon'] as IconData,
                size: 120,
                color: colors.primary,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              (product['nameKey'] as String).tr(),
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colors.onSurface,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              product['price'] as String,
              style: textTheme.titleLarge?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'description'.tr(),
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colors.onSurface,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              (product['descriptionKey'] as String).tr(),
              style: textTheme.bodyLarge?.copyWith(
                color: colors.onSurface.withValues(alpha: 0.8),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('added_to_cart'.tr()),
                      backgroundColor: colors.primary,
                    ),
                  );
                },
                child: Text('add_to_cart'.tr()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

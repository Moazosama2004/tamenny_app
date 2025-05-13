import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/tamenny_app.dart';

void showLanguagePicker(BuildContext context,
    {required String currentLanguage}) {
  final localeNotifier = Provider.of<LocaleNotifier>(context, listen: false);

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Choose Language',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            _buildLanguageOption(
              context: context,
              label: 'English',
              isSelected: currentLanguage == 'en',
              onTap: () {
                if (currentLanguage != 'en') {
                  localeNotifier.setLocale(Locale('en')); // Switch to English
                }
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 8),
            _buildLanguageOption(
              context: context,
              label: 'العربية',
              isSelected: currentLanguage == 'ar',
              onTap: () {
                if (currentLanguage != 'ar') {
                  localeNotifier.setLocale(Locale('ar')); // Switch to Arabic
                }
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}

Widget _buildLanguageOption({
  required BuildContext context,
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryColor.withOpacity(0.08)
            : AppColors.grayColor,
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.deepGrayColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? AppColors.primaryColor : AppColors.blueDarkColor,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        textAlign: TextAlign.start,
      ),
    ),
  );
}

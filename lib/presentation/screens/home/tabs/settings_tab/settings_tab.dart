import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/colors_manager.dart';
import '../../../../../provider/language_provider.dart';
import '../../../../../provider/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    final langProvider = Provider.of<LanguageProvider>(context, listen: true);
    final localizations = AppLocalizations.of(context);

    // Check if AppLocalizations is null
    if (localizations == null) {
      return Center(child: Text("Localization failed to load!"));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            localizations.theme,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColorLight),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: Theme.of(context).indicatorColor,
              border: Border.all(
                color: Theme.of(context).dialogBackgroundColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
              child: Row(
                children: [
                  // The selected theme text
                  Text(
                    themeProvider.isSelectedLight()
                        ? localizations.light
                        : localizations.dark,
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Theme.of(context).dialogBackgroundColor),
                  ),
                  Spacer(),
                  // The arrow icon on the right side to trigger dropdown
                  PopupMenuButton<String>(
                    onSelected: (String value) {
                      themeProvider.changeAppTheme(
                        value == localizations.light
                            ? ThemeMode.light
                            : ThemeMode.dark,
                      );
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          value: localizations.light,
                          child: Text(localizations.light),
                        ),
                        PopupMenuItem<String>(
                          value: localizations.dark,
                          child: Text(localizations.dark),
                        ),
                      ];
                    },
                    color: ColorsManager.whiteColor, // Set background color of the dropdown
                    child: Icon(Icons.arrow_drop_down, color: Theme.of(context).hintColor),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            localizations.language,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColorLight),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: Theme.of(context).indicatorColor,
              border: Border.all(
                color: Theme.of(context).dialogBackgroundColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
              child: Row(
                children: [
                  // The selected language text
                  Text(
                    langProvider.isSelectedEnglish()
                        ? localizations.english
                        : localizations.arabic,
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Theme.of(context).dialogBackgroundColor),
                  ),
                  Spacer(),
                  // The arrow icon on the right side to trigger dropdown
                  PopupMenuButton<String>(
                    onSelected: (String value) {
                      langProvider.changeAppLang(value == localizations.english ? 'en' : 'ar');
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          value: localizations.english,
                          child: Text(localizations.english),
                        ),
                        PopupMenuItem<String>(
                          value: localizations.arabic,
                          child: Text(localizations.arabic),
                        ),
                      ];
                    },
                    color: Colors.white, // Set background color of the dropdown
                    child: Icon(Icons.arrow_drop_down, color: Theme.of(context).hintColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

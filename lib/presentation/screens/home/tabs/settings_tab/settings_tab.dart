import 'package:flutter/material.dart';
import 'package:todo/core/colors_manager.dart';
import 'package:todo/core/my_text_styles.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String? selectedTheme = "Light"; // Default value for the dropdown
  String? selectedLang = "English"; // Default value for the dropdown

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            "Theme",
            style: MyTextStyles.settingsItemTextStyles,
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: Theme.of(context).indicatorColor,
              border: Border.all(color: Theme.of(context).dialogBackgroundColor, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
              child: Row(
                children: [
                  Text(
                    selectedTheme ?? "",
                    style:MyTextStyles.dropDownItems?.copyWith(color: Theme.of(context).dialogBackgroundColor),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    elevation: 0,
                    isExpanded: false,
                    underline: Container(),
                    items: <String>['Light', 'Dark'].map((String value) {
                      selectedTheme=value;
                      return DropdownMenuItem<String>(
                        value: selectedTheme,
                        child: Text(selectedTheme??""),
                      );
                    }).toList(),
                    onChanged: (newTheme) {
                      setState(() {
                        selectedTheme = newTheme;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Language",
            style: MyTextStyles.settingsItemTextStyles,
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: Theme.of(context).indicatorColor,
              border: Border.all(color: Theme.of(context).dialogBackgroundColor, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
              child: Row(
                children: [
                  Text(
                    selectedLang??"",
                    style: MyTextStyles.dropDownItems?.copyWith(color: Theme.of(context).dialogBackgroundColor),
                  ),

                  const Spacer(),
                  DropdownButton<String>(
                    elevation: 0,
                    isExpanded: false,
                    underline: Container(),
                    items: <String>['Arabic', 'English'].map((String value) {
                      selectedLang=value;
                      return DropdownMenuItem<String>(
                        value: selectedLang,
                        child: Text(selectedLang??""),
                      );
                    }).toList(),
                    onChanged: (newLang) {
                      setState(() {
                        selectedLang = newLang;
                      });
                    },
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_mvvm/ui/states/settings_state.dart';
import '../../../model/settings/app_settings.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettingsState settingsState = context.watch<AppSettingsState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: settingsState.theme.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text("Settings", style: AppTextStyles.heading),

            SizedBox(height: 50),

            Text(
              "Theme",
              style: AppTextStyles.label.copyWith(color: AppColors.textLight),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ThemeColor.values
                .map(
                  (theme) => ThemeColorButton(
                    themeColor: theme,
                    isSelected: settingsState.theme == theme,
                    onTap: (value) {
                      settingsState.changeTheme(value);
                    },
                  ),
                )
                .toList(),
            ),
          ],
        )
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:week6_mvvm/data/repositories/app_settings/app_setting_repository.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {

  AppSettings? _appSettings;
  AppSettingRepository _appSettingRepo;

  AppSettingsState(
    this._appSettingRepo
  );

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await _appSettingRepo.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);

    notifyListeners();
  }
}

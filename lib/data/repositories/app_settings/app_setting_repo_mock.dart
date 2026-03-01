import 'package:week6_mvvm/data/repositories/app_settings/app_setting_repository.dart';
import 'package:week6_mvvm/model/settings/app_settings.dart';

class AppSettingRepoMock implements AppSettingRepository {

  AppSettings settings = AppSettings(themeColor: ThemeColor.blue);
  @override
  Future<AppSettings> load() async{
    return settings;
  }
  @override
  Future<void> save(AppSettings appSettings) async{
    settings = appSettings;
  } 
}
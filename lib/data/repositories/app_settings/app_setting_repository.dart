import 'package:week6_mvvm/model/settings/app_settings.dart';

abstract class AppSettingRepository {

  Future<AppSettings> load();

  Future<void> save(AppSettings settings); 
  
}
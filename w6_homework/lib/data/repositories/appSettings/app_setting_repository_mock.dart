import 'package:w6_homework/data/repositories/appSettings/app_setting_repository.dart';
import 'package:w6_homework/model/settings/app_settings.dart';

class AppSettingRepositoryMock implements AppSettingRepository {
  AppSettings? _settings;
  @override
  Future<AppSettings> load() async {
    return _settings ?? AppSettings(themeColor: ThemeColor.blue);
  }

  @override
  Future<void> save(AppSettings setting) async {
    _settings = setting;
  }
}

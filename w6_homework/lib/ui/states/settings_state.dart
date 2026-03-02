import 'package:flutter/widgets.dart';
import 'package:w6_homework/data/repositories/appSettings/app_setting_repository.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  final AppSettingRepository _repository;
  AppSettings? _appSettings;

  AppSettingsState(this._repository);

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await _repository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.pink;

  Future<void> changeTheme(ThemeColor themeColor) async {
    _appSettings ??= await _repository.load();
    
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);
    await _repository.save(_appSettings!);
    notifyListeners();
  }
}

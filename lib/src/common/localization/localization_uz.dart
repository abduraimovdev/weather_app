import 'localization.dart';

/// The translations for Uzbek (`uz`).
class LocalizationUz extends Localization {
  LocalizationUz([String locale = 'uz']) : super(locale);

  @override
  String get services_app => 'Weather App';

  @override
  String get update => 'Обновить';

  @override
  String get no_cached_data => 'Нет кэшированных данных';

  @override
  String get details => 'Детали';

  @override
  String get m_sec => 'м/сек';

  @override
  String get home => 'Asosiy';

  @override
  String get card => 'Karta';
}

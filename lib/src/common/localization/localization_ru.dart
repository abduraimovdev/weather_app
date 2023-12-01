import 'localization.dart';

/// The translations for Russian (`ru`).
class LocalizationRu extends Localization {
  LocalizationRu([String locale = 'ru']) : super(locale);

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
  String get home => 'Главный';

  @override
  String get card => 'Карта';
}

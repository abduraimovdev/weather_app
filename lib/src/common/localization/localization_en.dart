import 'localization.dart';

/// The translations for English (`en`).
class LocalizationEn extends Localization {
  LocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get services_app => 'Weather App';

  @override
  String get update => 'Update';

  @override
  String get no_cached_data => 'No cached data';

  @override
  String get details => 'Details';

  @override
  String get m_sec => 'm/sec';

  @override
  String get home => 'Home';

  @override
  String get card => 'Card';
}

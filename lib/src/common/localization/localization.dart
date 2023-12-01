import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localization_en.dart';
import 'localization_ru.dart';
import 'localization_uz.dart';

/// Callers can lookup localized strings with an instance of Localization
/// returned by `Localization.of(context)`.
///
/// Applications need to include `Localization.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Localization.localizationsDelegates,
///   supportedLocales: Localization.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Localization.supportedLocales
/// property.
abstract class Localization {
  Localization(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization)!;
  }

  static const LocalizationsDelegate<Localization> delegate = _LocalizationDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz')
  ];

  /// No description provided for @services_app.
  ///
  /// In uz, this message translates to:
  /// **'Weather App'**
  String get services_app;

  /// No description provided for @update.
  ///
  /// In uz, this message translates to:
  /// **'Обновить'**
  String get update;

  /// No description provided for @no_cached_data.
  ///
  /// In uz, this message translates to:
  /// **'Нет кэшированных данных'**
  String get no_cached_data;

  /// No description provided for @details.
  ///
  /// In uz, this message translates to:
  /// **'Детали'**
  String get details;

  /// No description provided for @m_sec.
  ///
  /// In uz, this message translates to:
  /// **'м/сек'**
  String get m_sec;

  /// No description provided for @home.
  ///
  /// In uz, this message translates to:
  /// **'Asosiy'**
  String get home;

  /// No description provided for @card.
  ///
  /// In uz, this message translates to:
  /// **'Karta'**
  String get card;
}

class _LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const _LocalizationDelegate();

  @override
  Future<Localization> load(Locale locale) {
    return SynchronousFuture<Localization>(lookupLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_LocalizationDelegate old) => false;
}

Localization lookupLocalization(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return LocalizationEn();
    case 'ru': return LocalizationRu();
    case 'uz': return LocalizationUz();
  }

  throw FlutterError(
    'Localization.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

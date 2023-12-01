import 'package:flutter/material.dart';

import '../../localization/localization.dart';
import '../../theme/theme.dart';

extension BuildContextExt on BuildContext {
  Localization get l10n => Localization.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Locale get locale => Localizations.localeOf(this);

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;

  ThemeTextStyles get textStyle => Theme.of(this).extension<ThemeTextStyles>()!;
}

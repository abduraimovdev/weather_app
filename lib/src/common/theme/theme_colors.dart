part of './theme.dart';

final class AppColorSchema {
  const AppColorSchema();

  // todo(--For Light--)
  static const ColorScheme colorLightScheme = ColorScheme.light(
    primary: Color(0xFF62B8F6),
    surface: Color(0xFFFAFAFA),
    onSurface: Color(0xFF242424),
    secondary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF616161),
    error: Color(0xFFD93F2F),
    surfaceVariant: Color(0xFFF5F5F5),
    secondaryContainer: Color(0xFFF0F0F0),
    onBackground: Color(0xFFFFFFFF),
    outline: Color(0xFF9AA6AC),
    background: Color(0xFFEFEEF3),
  );

  // todo(--For Dark--)
  static const ColorScheme colorDarkScheme = ColorScheme.dark(
    primary: Color(0xFF62B8F6),
    surface: Color(0xFFFAFAFA),
    onSurface: Color(0xFF242424),
    secondary: Color(0xFFF3793E),
    onSecondary: Color(0xFF616161),
    error: Color(0xFFD93F2F),
    surfaceVariant: Color(0xFFF5F5F5),
    secondaryContainer: Color(0xFFF0F0F0),
    onBackground: Color(0xFFFFFFFF),
    outline: Color(0xFF9AA6AC),
    background: Color(0xFFEFEEF3),
  );
}

// todo--# Additional ThemeColors Custom
class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.black,
    required this.blue,
    required this.lightBlue,
    required this.primary,
    required this.white,
  });

  final Color black;

  final Color blue;

  final Color lightBlue;

  final Color primary;

  final Color white;

  static const ThemeColors light = ThemeColors(
    black: Color(0xFF171215),
    blue: Color(0xFF2C79C1),
    lightBlue: Color(0xFF62B8F6),
    primary: Color(0xFF37BD6B),
    white: Color(0xFFFFFFFF),
  );
  static const ThemeColors dark = ThemeColors(
    black: Color(0xFF171215),
    blue: Color(0xFF2C79C1),
    lightBlue: Color(0xFF62B8F6),
    primary: Color(0xFF37BD6B),
    white: Color(0xFFFFFFFF),
  );

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      black: Color.lerp(black, other.black, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      white: Color.lerp(white, other.white, t)!,
    );
  }

  @override
  ThemeColors copyWith({
    Color? black,
    Color? blue,
    Color? lightBlue,
    Color? primary,
    Color? white,
  }) =>
      ThemeColors(
        black: black ?? this.black,
        blue: blue ?? this.blue,
        lightBlue: lightBlue ?? this.lightBlue,
        primary: primary ?? this.primary,
        white: white ?? this.white,
      );
}

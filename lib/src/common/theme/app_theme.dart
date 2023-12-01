part of './theme.dart';

final class AppTheme {
  const AppTheme._();

  static final appTheme = ThemeData(
    useMaterial3: true,
    // Updated Version => Default True
    applyElevationOverlayColor: true,
    splashFactory:
        Platform.isAndroid ? InkRipple.splashFactory : NoSplash.splashFactory,
    visualDensity: VisualDensity.standard,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
      ),
    ),
    dividerTheme: const DividerThemeData(thickness: 1),
  );

  static final ThemeData lightTheme = appTheme.copyWith(
    extensions: <ThemeExtension<dynamic>>[
      ThemeTextStyles.light,
      ThemeColors.light,
    ],
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      selectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedItemColor: const Color(0xff7F7F80),
      selectedItemColor: AppColorSchema.colorLightScheme.primary,
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.white,
      height: kToolbarHeight,
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
        (states) => const IconThemeData(
          color: Colors.black,
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = appTheme.copyWith(
    extensions: <ThemeExtension<dynamic>>[
      ThemeTextStyles.dark,
      ThemeColors.dark,
    ],
  );
}

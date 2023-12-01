part of './theme.dart';

const String fontGilroy = 'Gilroy';
// const String fontRaleway = 'Raleway';
// const String fontManrope = 'Manrope';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  const ThemeTextStyles({
    required this.kBlackStyle14w600,
    required this.kWhiteStyle20w600,
    required this.kWhiteStyle16w600,
    required this.kGreyStyle12w400,
    required this.kGreyStyle30wItalic,
    required this.kGreyStyle30wBold,
    required this.kGreyStyle12,
    required this.kGreyStyle16,
  });

  final TextStyle kBlackStyle14w600;
  final TextStyle kWhiteStyle20w600;
  final TextStyle kWhiteStyle16w600;
  final TextStyle kGreyStyle12w400;
  final TextStyle kGreyStyle30wItalic;
  final TextStyle kGreyStyle30wBold;
  final TextStyle kGreyStyle12;
  final TextStyle kGreyStyle16;

  static ThemeTextStyles light = ThemeTextStyles(
    kBlackStyle14w600: const TextStyle(
      fontSize: 14,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w600,
      color: Color(0xFF000000),
    ),
    kWhiteStyle20w600: const TextStyle(
      fontSize: 20,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
    ),
    kWhiteStyle16w600: const TextStyle(
      fontSize: 16,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
    ),
    kGreyStyle12w400: const TextStyle(
      fontSize: 12,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
    kGreyStyle30wItalic: const TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontStyle: FontStyle.italic,
    ),
    kGreyStyle30wBold: const TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    ),
    kGreyStyle12: TextStyle(
      color: Colors.white.withOpacity(0.7),
      fontSize: 12,
    ),
    kGreyStyle16: const TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  );

  static ThemeTextStyles dark = ThemeTextStyles(
    kBlackStyle14w600: const TextStyle(
      fontSize: 14,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w600,
      color: Color(0xFF000000),
    ),
    kGreyStyle16: const TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    kGreyStyle30wBold: const TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    ),
    kGreyStyle12: TextStyle(
      color: Colors.white.withOpacity(0.7),
      fontSize: 12,
    ),
    kGreyStyle30wItalic: const TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontStyle: FontStyle.italic,
    ),
    kWhiteStyle20w600: const TextStyle(
      fontSize: 20,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
    ),
    kWhiteStyle16w600: const TextStyle(
      fontSize: 16,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
    ),
    kGreyStyle12w400: const TextStyle(
      fontSize: 12,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
  );

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? kBlackStyle14w600,
    TextStyle? kWhiteStyle20w600,
    TextStyle? kWhiteStyle16w600,
    TextStyle? kGreyStyle12w400,
    TextStyle? kGreyStyle30wItalic,
    TextStyle? kGreyStyle30wBold,
    TextStyle? kGreyStyle12,
    TextStyle? kGreyStyle16,
  }) =>
      ThemeTextStyles(
        kBlackStyle14w600: kBlackStyle14w600 ?? this.kBlackStyle14w600,
        kWhiteStyle20w600: kWhiteStyle20w600 ?? this.kWhiteStyle20w600,
        kWhiteStyle16w600: kWhiteStyle16w600 ?? this.kWhiteStyle16w600,
        kGreyStyle12w400: kGreyStyle12w400 ?? this.kGreyStyle12w400,
        kGreyStyle30wItalic: kGreyStyle30wItalic ?? this.kGreyStyle30wItalic,
        kGreyStyle30wBold: kGreyStyle30wBold ?? this.kGreyStyle30wBold,
        kGreyStyle12: kGreyStyle12 ?? this.kGreyStyle12,
        kGreyStyle16: kGreyStyle16 ?? this.kGreyStyle16,
      );

  @override
  ThemeExtension<ThemeTextStyles> lerp(
    ThemeExtension<ThemeTextStyles>? other,
    double t,
  ) {
    if (other is! ThemeTextStyles) {
      return this;
    }
    return ThemeTextStyles(
      kBlackStyle14w600:
          TextStyle.lerp(kBlackStyle14w600, other.kBlackStyle14w600, t)!,
      kWhiteStyle20w600:
          TextStyle.lerp(kWhiteStyle20w600, other.kWhiteStyle20w600, t)!,
      kWhiteStyle16w600:
          TextStyle.lerp(kWhiteStyle16w600, other.kWhiteStyle16w600, t)!,
      kGreyStyle12w400:
          TextStyle.lerp(kGreyStyle12w400, other.kGreyStyle12w400, t)!,
      kGreyStyle30wItalic:
          TextStyle.lerp(kGreyStyle30wItalic, other.kGreyStyle30wItalic, t)!,
      kGreyStyle30wBold:
          TextStyle.lerp(kGreyStyle30wBold, other.kGreyStyle30wBold, t)!,
      kGreyStyle12: TextStyle.lerp(kGreyStyle12, other.kGreyStyle12, t)!,
      kGreyStyle16: TextStyle.lerp(kGreyStyle16, other.kGreyStyle16, t)!,
    );
  }
}

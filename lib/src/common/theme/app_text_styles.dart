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
  });

  final TextStyle kBlackStyle14w600;
  final TextStyle kWhiteStyle20w600;
  final TextStyle kWhiteStyle16w600;
  final TextStyle kGreyStyle12w400;

  static ThemeTextStyles light = const ThemeTextStyles(
    kBlackStyle14w600: TextStyle(
      fontSize: 14,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w600,
      color: Color(0xFF000000),
    ),
    kWhiteStyle20w600: TextStyle(
      fontSize: 20,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
    ),
    kWhiteStyle16w600: TextStyle(
      fontSize: 16,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
    ),
    kGreyStyle12w400: TextStyle(
      fontSize: 12,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
  );

  static ThemeTextStyles dark = const ThemeTextStyles(
    kBlackStyle14w600: TextStyle(
      fontSize: 14,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w600,
      color: Color(0xFF000000),
    ),
    kWhiteStyle20w600: TextStyle(
      fontSize: 20,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
    ),
    kWhiteStyle16w600: TextStyle(
      fontSize: 16,
      fontFamily: fontGilroy,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
    ),
    kGreyStyle12w400: TextStyle(
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
  }) =>
      ThemeTextStyles(
        kBlackStyle14w600: kBlackStyle14w600 ?? this.kBlackStyle14w600,
        kWhiteStyle20w600: kWhiteStyle20w600 ?? this.kWhiteStyle20w600,
        kWhiteStyle16w600: kWhiteStyle16w600 ?? this.kWhiteStyle16w600,
        kGreyStyle12w400: kGreyStyle12w400 ?? this.kGreyStyle12w400,
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
    );
  }
}

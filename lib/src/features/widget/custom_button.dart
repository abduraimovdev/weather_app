import 'package:flutter/material.dart';
import '../../common/theme/theme.dart';
import '../../common/util/extension/context_extensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.content,
    required this.onPressed,
    this.color = AppColors.main,
    this.elevation = 0,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    super.key,
  });

  final Color color;
  final double elevation;
  final String content;
  final void Function() onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: TextButton(
          style: TextButton.styleFrom(
            elevation: elevation,
            shadowColor: color,
            backgroundColor: color,
            minimumSize: const Size(double.infinity, 50),
            fixedSize: const Size(double.infinity, 50),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            content,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      );
}

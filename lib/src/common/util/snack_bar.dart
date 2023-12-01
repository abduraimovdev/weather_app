import 'package:flutter/material.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';

import '../theme/theme.dart';

void showSnackBar(
  BuildContext context,
  String title, {
  String? content,
  Color color = AppColors.error,
  Duration duration = const Duration(seconds: 3),
}) =>
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: RichText(
            text: TextSpan(
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.white,
              ),
              text: '$title\n',
              children: [
                if (content != null)
                  TextSpan(
                    text: content,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
              ],
            ),
          ),
          backgroundColor: color,
          duration: duration,
        ),
      );

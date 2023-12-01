import 'package:flutter/material.dart';
import 'package:weather_app/src/common/theme/theme.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';

class WError extends StatelessWidget {
  String? message;
  final TextStyle? style;
  final int? maxLines;
  final EdgeInsets? textPadding;
  final bool hasFlexibleHeight;
  final VoidCallback? onPressed;

  WError({
    required this.message,
    this.onPressed,
    this.textPadding,
    this.maxLines,
    this.hasFlexibleHeight = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          hasFlexibleHeight ? null : MediaQuery.of(context).size.height - 116,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: textPadding ?? AppSize.paddingH16,
            child: Text(
              (message ?? ''),
              style: style ?? context.textStyle.kWhiteStyle16w600,
              maxLines: maxLines,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: AppSize.paddingAll16,
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                'salom',
                style: context.textStyle.kWhiteStyle20w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}

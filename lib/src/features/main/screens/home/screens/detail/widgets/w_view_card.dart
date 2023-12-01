import 'package:flutter/material.dart';
import 'package:weather_app/src/common/theme/theme.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';

class WCard extends StatelessWidget {
  final String? title;
  final String? icon;

  const WCard({
    Key? key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: AppSize.radiusAll16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon?.svg(height: 48, color: context.color.lightBlue) ?? const SizedBox(),
          Padding(
            padding: AppSize.paddingTop24,
            child: Text(
              title ?? '',
              style: context.textStyle.kBlackStyle14w600,
            ),
          ),
        ],
      ),
    );
  }
}

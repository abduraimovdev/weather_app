import 'package:flutter/material.dart';
import 'package:weather_app/src/common/theme/theme.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';


class WBackground extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;

  const WBackground({Key? key, this.child, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppSize.radiusAll12,
          color: context.color.white,
        ),
        margin: AppSize.paddingV8H16,
        padding: AppSize.paddingAll16,
        child: child,
      ),
    );
  }
}

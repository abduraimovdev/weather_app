import 'package:flutter/material.dart';

import '../../common/theme/theme.dart';


/// {@template app_button}
/// AppButton widget.
/// {@endtemplate}
class AppButton extends StatelessWidget {
  /// {@macro app_button}
  const AppButton({
    required this.onPressed,
    required this.child,
    this.color = AppColors.white,
    super.key,
  });

  final Widget child;
  final void Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            color: color,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(187, 187, 187, 0.32),
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: MaterialButton(
            onPressed: onPressed,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: child,
            ),
          ),
        ),
      );
}

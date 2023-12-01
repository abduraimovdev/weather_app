import 'package:flutter/material.dart';

import '../../../common/theme/theme.dart';

import '../../../common/util/extension/context_extensions.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    required this.currentIndex,
    this.onTap,
    this.onScanTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;
  final VoidCallback? onScanTap;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(color: context.color.lightBlue),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          elevation: 0,
          color: context.color.white,
          height: kBottomNavigationBarHeight,
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomMenuItem(
                onTap: () {
                  onTap?.call(0);
                },
                isSelected: currentIndex == 0,
                label: context.l10n.home,
                icon: Icons.home,
              ),
              BottomMenuItem(
                onTap: () {
                  onTap?.call(1);
                },
                isSelected: currentIndex == 1,
                label: context.l10n.card,
                icon: Icons.credit_card_outlined,
              ),
            ],
          ),
        ),
      );
}

class BottomMenuItem extends StatelessWidget {
  const BottomMenuItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    super.key,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Semantics(
          child: InkResponse(
            onTap: onTap,
            customBorder: const CircleBorder(),
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSelected
                      ? context.theme.bottomNavigationBarTheme.selectedItemColor
                      : context
                          .theme.bottomNavigationBarTheme.unselectedItemColor,
                ),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: context
                      .theme.bottomNavigationBarTheme.selectedLabelStyle
                      ?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: isSelected
                        ? context
                            .theme.bottomNavigationBarTheme.selectedItemColor
                        : context
                            .theme.bottomNavigationBarTheme.unselectedItemColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

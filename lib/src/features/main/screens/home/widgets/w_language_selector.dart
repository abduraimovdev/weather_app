import 'package:flutter/material.dart';
import 'package:weather_app/src/common/dependecies/app_dependencies.dart';
import 'package:weather_app/src/common/theme/theme.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';
import '../../../../../common/constant/constants.dart';


class WLanguageSelector extends StatelessWidget {
  const WLanguageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: AppSize.radiusAll12),
      icon: const Icon(Icons.language),
      initialValue: context.locale,
      itemBuilder: (context) => AppConstants.languages
          .map(
            (type) => PopupMenuItem(
              value: type,
              child: Text(
                type.languageCode,
              ),
            ),
          )
          .toList(),
      onSelected: (v) async {
        await AppScope.update(
            context, AppScope.of(context).copyWith(locale: v));
      },
    );
  }
}

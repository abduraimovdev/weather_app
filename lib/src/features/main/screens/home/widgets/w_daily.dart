import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/common/router/routes.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';
import '../../../../../common/theme/theme.dart';

import '../data/models/daily_weather.dart';
import 'w_background.dart';

class WDaily extends StatelessWidget {
  final DailyWeather? weather;

  const WDaily({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WBackground(
      onPressed: () => context.pushNamed(AppRouteNames.detail, extra: weather),
      child: Row(
        children: [
          Text(
            DateFormat("dd MMM yyyy", context.locale.languageCode)
                .format(weather!.dateTime!),
            style: context.textStyle.kBlackStyle14w600,
          ),
          const Spacer(),
          AppSvg.day.svg(),
          Padding(
            padding: AppSize.paddingLeft4,
            child: Text(
              '${weather?.temp?.day?.toString() ?? ' '} °C',
              style: context.textStyle.kBlackStyle14w600,
            ),
          ),
          Padding(
            padding: AppSize.paddingLeft24,
            child: AppSvg.night.svg(height: 18),
          ),
          Padding(
            padding: AppSize.paddingLeft4,
            child: Text(
              '${weather?.temp?.night?.toString() ?? ' '} °C',
              style: context.textStyle.kBlackStyle14w600,
            ),
          ),
        ],
      ),
    );
  }
}

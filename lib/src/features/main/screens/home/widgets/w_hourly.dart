
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/common/router/routes.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';

import '../data/models/hourly_weather.dart';
import 'w_background.dart';

class WHourly extends StatelessWidget {
  final HourlyWeather? weather;

  const WHourly({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WBackground(
      onPressed: () => context.pushNamed(AppRouteNames.detail, extra: weather),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat("HH:mm").format(weather!.dateTime!),
                style: context.textStyle.kBlackStyle14w600,
              ),
              Text(
                DateFormat("dd MMM yyyy", context.locale.languageCode)
                    .format(weather!.dateTime!),
                style: context.textStyle.kGreyStyle12w400,
              ),
            ],
          ),
          Text(
            '${weather?.temp?.toString() ?? ' '} °C',
            style: context.textStyle.kBlackStyle14w600,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';

import '../../../../../../../common/theme/theme.dart';
import '../../../data/models/daily_weather.dart';
import '../../../data/models/hourly_weather.dart';
import '../widgets/w_view_card.dart';

class DetailScreen extends StatelessWidget {
  final DailyWeather? dWeather;
  final HourlyWeather? hWeather;
  const DetailScreen({super.key, this.dWeather, this.hWeather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.lightBlue,
      appBar: AppBar(
        title: Text(
          context.l10n.details,
          style: context.textStyle.kWhiteStyle20w600,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
      ),
      body: Padding(
        padding: AppSize.paddingAll16,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          children: [
            WCard(
              icon: AppSvg.temperature,
              title:
              '${dWeather?.temp?.day?.toString() ?? hWeather?.temp?.toString() ?? ' '} °C',
            ),
            WCard(
              icon: AppSvg.humidity,
              title:
              "${dWeather?.humidity.toString() ?? hWeather?.humidity?.toString() ?? ' '} %",
            ),
            WCard(
              icon: AppSvg.pressure,
              title:
              "${dWeather?.pressure?.toString() ?? hWeather?.pressure?.toString() ?? ' '} hPa",
            ),
            WCard(
              icon: AppSvg.wind,
              title:
              "${dWeather?.windSpeed?.toString() ?? hWeather?.windSpeed?.toString() ?? ' '} ${context.l10n.m_sec}",
            ),
          ],
        ),
      ),
    );
  }
}

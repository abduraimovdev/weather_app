import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/common/theme/theme.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';

import '../bloc/weather_bloc.dart';

class WCurrentLocation extends StatelessWidget {
  const WCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<WeatherBloc>().add(
            const WeatherSetCurrentLocationEvent(),
          ),
      icon: AppSvg.currentLocation.svg(color: context.color.white),
    );
  }
}

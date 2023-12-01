import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';

import '../bloc/weather_bloc.dart';
import '../widgets/w_current_location.dart';
import '../widgets/w_error.dart';
import '../widgets/w_language_selector.dart';
import '../widgets/w_loader.dart';
import '../widgets/w_type_selector.dart';
import '../widgets/w_weathers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static _HomeScreenState? of(BuildContext context) =>
      context.findAncestorStateOfType<_HomeScreenState>();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.color.lightBlue,
        appBar: AppBar(
          elevation: 0,
          title: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) => state.status == WeatherStatus.success
                ? Text(
                    '${state.geoCode.name ?? ' '} ${state.geoCode.country ?? ' '}',
                    style: context.textStyle.kWhiteStyle20w600,
                  )
                : const SizedBox(),
          ),
          backgroundColor: Colors.transparent,
          actions: const [
            WCurrentLocation(),
            WLanguageSelector(),
            WTypeSelector(),
          ],
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state.status == WeatherStatus.success) {
              return const WWeathers();
            }
            if (state.status == WeatherStatus.error) {
              return WError(
                message: state.errorMessage,
                onPressed: () => context.read<WeatherBloc>().add(
                      const WeatherGetEvent(),
                    ),
              );
            }
            return const WLoader();
          },
        ),
      );
}

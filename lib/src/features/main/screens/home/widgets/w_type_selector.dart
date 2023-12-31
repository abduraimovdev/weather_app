import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/common/theme/theme.dart';
import '../bloc/weather_bloc.dart';

class WTypeSelector extends StatelessWidget {
  const WTypeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return PopupMenuButton(
          shape: RoundedRectangleBorder(borderRadius: AppSize.radiusAll12),
          initialValue: state.type,
          itemBuilder: (context) => WeatherType.values
              .map(
                (type) => PopupMenuItem(
                  value: type,
                  child: Text(
                    type.name,
                  ),
                ),
              )
              .toList(),
          onSelected: (v) =>
              context.read<WeatherBloc>().add(WeatherSetTypeEvent(type: v)),
        );
      },
    );
  }
}

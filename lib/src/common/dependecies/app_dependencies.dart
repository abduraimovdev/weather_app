import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

import '../../features/widget/cupertino_back/cupertino_back_gesture.dart';
import '../../features/widget/keyboard/keyboard_dismiss.dart';
import '../service/local_data_storage/local_data_storage.dart';

class AppScope extends Equatable {
  const AppScope({
    required this.themeMode,
    required this.locale,
  });

  final ThemeMode themeMode;
  final Locale locale;

  /// Returns a [SystemUiOverlayStyle] based on the [ThemeMode] setting.
  /// In other words, if the theme is dark, returns light; if the theme is
  /// light, returns dark.
  SystemUiOverlayStyle resolvedSystemUiOverlayStyle() {
    Brightness brightness;
    switch (themeMode) {
      case ThemeMode.light:
        brightness = Brightness.light;
      case ThemeMode.dark:
        brightness = Brightness.dark;
      default:
        brightness =
            WidgetsBinding.instance.platformDispatcher.platformBrightness;
    }

    final overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return overlayStyle;
  }

  AppScope copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) =>
      AppScope(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
      );

  static AppScope of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    return scope.modelBindingState.currentModel;
  }

  static Future<void> update(BuildContext context, AppScope newModel) async {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;

    scope.modelBindingState.updateModel(newModel);
  }

  @override
  List<Object> get props => [themeMode, locale];
}

class _ModelBindingScope extends InheritedWidget {
  const _ModelBindingScope({
    required this.modelBindingState,
    required super.child,
  });

  final _DependencyScopeState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class DependencyScope extends StatefulWidget {
  const DependencyScope({
    required this.initialModel,
    required this.child,
    super.key,
  });

  final AppScope initialModel;
  final Widget child;

  @override
  State<DependencyScope> createState() => _DependencyScopeState();
}

class _DependencyScopeState extends State<DependencyScope> {
  late AppScope currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(AppScope newModel) {
    if (newModel != currentModel) {
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) => KeyboardDismiss(
        child: BackGestureWidthTheme(
          backGestureWidth: BackGestureWidth.fraction(1 / 4),
          child: _ModelBindingScope(
            modelBindingState: this,
            child: widget.child,
          ),
        ),
      );
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState(status: MainStatus.initial, page: 0)) {
    on<MainChangeEvent>(_changeScreen);
  }

  void _changeScreen(MainChangeEvent event, Emitter emit) {
    emit(state.copyWith(page: event.page, status: MainStatus.changeScreen));
  }
}

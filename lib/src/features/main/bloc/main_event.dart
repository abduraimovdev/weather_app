part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainChangeEvent extends MainEvent {
  final int page;

  const MainChangeEvent({required this.page});

  @override
  List<Object?> get props => [];
}
